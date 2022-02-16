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

require_relative 's_disk'

module EZ_INTERVALS
    module EZ_CONTRACTORS
        def s_interdisks(b, disks, outer = false)
        	if outer then
                incl = false
                union = IntervalVector[Interval::EMPTY_SET, Interval::EMPTY_SET]
                disks.each{|d|
                    b1, incl1 = s_disk(b, d, true)
                    union = union | b1
                    incl = (incl or incl1)
                }
                b = union
        	else
                incl = true
                intersection = b
                disks.each{|d|
                    b1, incl1 = s_disk(b, d, false)
                    intersection = intersection & b1
                    incl = (incl and incl1)
                }
                b = intersection
        	end
            return b, incl
        end
    end
end