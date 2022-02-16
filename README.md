
P1788
=====
HELLO
P1788 is a Ruby extension wrapping the C++ [libieeep1788](https://github.com/nehmeier/libieeep1788) interval arithmetic library.

The goal of this gem is to allow doing basic arithmetic in Ruby on set-based intervals.
The output of operations are guaranteed to enclose the true result of operations.

Forward-mode and reverse-mode elementary functions are implemented to allow building [contractors](https://en.wikipedia.org/wiki/Interval_contractor).


Documentation
-------------

The API documentation is hosted on [rubydoc.info](https://www.rubydoc.info/gems/p1788).

You can also build the documentation yourself from the [sources](https://gitlab.ensta-bretagne.fr/bollenth/p1788):

~~~bash
# Install yard if you don't have it
gem install yard
# Clone the repository on your machine
git clone https://gitlab.ensta-bretagne.fr/bollenth/p1788.git
cd p1788
# Build the documentation
yard
# Open it!
firefox doc/index.html
~~~

Installation
------------

Basically:

~~~bash
gem install p1788
~~~

To compile, P1788 requires to have the GNU [GMP](https://gmplib.org/) and [MPFR](https://www.mpfr.org/) development libraries installed on your machine,
as well as the Ruby development headers:

~~~bash
sudo apt install libgmp-dev libmpfr-dev ruby-dev
~~~

A copy of _libieeep1788_ is embedded into this gem, so you do not need to install it.
However, if an installation of _libieeep1788_ is found on your machine while the gem is installing, it will be used instead of the embedded copy.
Note: to install _libieeep1788_ from its [github repository](https://github.com/nehmeier/libieeep1788),
you may need to remove the flags `-Wextra -Werror` around line 65 of file `libieeep1788/CMakeLists.txt`:

~~~diff
-set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra -Werror -pedantic")
+set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -pedantic")
~~~

### Installation from sources

To install P1788 from sources:

~~~bash
# Clone the repository on your machine
git clone https://gitlab.ensta-bretagne.fr/bollenth/p1788.git
cd p1788
# Build the gem
gem build p1788.gemspec
# Install the gem (x.y.z is the gem version)
gem install p1788-x.y.z.gem
~~~

