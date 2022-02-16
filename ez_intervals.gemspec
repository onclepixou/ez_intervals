# Copyright (C) 2022 Pierre Filiol <pierre.filiol@netc.fr>
#
# This file is part of ez_intervals. <https://github.com/onclepixou/ez_intervals>
#
# ez_intervals is free software: you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published
# by the Free Software Foundation, either version 3 of the License,
# or (at your option) any later version.
#
# ez_intervals is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
# See the GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with ez_intervals. If not, see <https://www.gnu.org/licenses/>. 

Gem::Specification.new do |s|
    s.name        = 'ez_intervals'
    s.version     = "1.0"
    s.summary     = "Some useful interval stuffs"
    s.description = "Useful interval algorithms/contractors/separators based on ez_intervals library"
    s.authors     = ["Pierre Filiol"]
    s.email       = 'pierre.filiol@netc.fr'
    s.files       = ["LICENSE",
                     "NOTICE",
                     "README.md",
                     "ez_intervals.gemspec",
                     "lib/algorithms/sivia.rb",
                     "lib/contractors/c_disk.rb",
                     "lib/contractors/s_disk.rb",
                     "lib/contractors/s_interdisks.rb",
                     "lib/types/disk.rb"
    ]
    s.homepage    = 'https://github.com/onclepixou/ez_intervals'
    s.license     = 'GPL-3.0+'
  end