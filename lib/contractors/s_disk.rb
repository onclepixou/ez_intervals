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

require_relative 'c_disk'
require_relative '../types/disk'

module EZ_INTERVALS
    module EZ_CONTRACTORS
		def s_disk(b, d, outer = false)
		    cx, cy = d.center
		    r = d.radius
			if outer then
				din = EZ_TYPES::Disk.new(cx, cy, Interval[0, r.inf])
				dout = EZ_TYPES::Disk.new(cx, cy, Interval[r.sup, Float::INFINITY])
				ba, incla = c_disk(b, din)
				bb, inclb = c_disk(b, dout)
				b = ba | bb
				incl = (incla or inclb)
			else
				b, incl = c_disk(b, d)
			end
			return b, incl
		end
	end
end