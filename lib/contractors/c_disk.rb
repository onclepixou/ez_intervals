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

require 'p1788'
include P1788

require_relative '../types/disk'

module EZ_INTERVALS
      module EZ_CONTRACTORS
            def c_disk(box, disk)
                    x = box[0]
                    y = box[1]
                    cx, cy = disk.center
                    r2 = disk.radius.sqr
                    a = x - cx
                    b = y - cy
                    a2 = sqr(a)
                    b2 = sqr(b)
                    c = a2 + b2
                    incl = c.subset_of? r2
                    c &= r2
                    a2 = add_rev(b2, c, a2)
                    b2 = add_rev(a2, c, b2)
                    a = sqr_rev(a2, a)
                    b = sqr_rev(b2, b)
                    x = sub_rev1(cx, a, x)
                    y = sub_rev1(cy, b, y)
                    return IntervalVector[x, y], incl
            end
      end
end
