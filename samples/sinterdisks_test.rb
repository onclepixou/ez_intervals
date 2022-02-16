#! /usr/bin/env ruby

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

require_relative '../lib/ez_intervals'
include EZ_INTERVALS
include EZ_ALGORITHMS
include EZ_CONTRACTORS

initial_box = IntervalVector[Interval[-5, 9], Interval[-4, 12]]
d1 = EZ_TYPES::Disk.new(1, 2, Interval[4, 5])
d2 = EZ_TYPES::Disk.new(2, 5, Interval[5, 6])
d3 = EZ_TYPES::Disk.new(2, 2, Interval[3, 5])
disks = [d1, d2, d3]

[false, true].each do |outer|
	bin, bon, ball = sivia(initial_box, 0.1) {|b| s_interdisks(b, disks, outer)}

	f = Figure.new(width: 1024, xlabel: 'x', ylabel: 'y', title: "Ring #{outer ? 'out' : 'in'}")
	f.set_range initial_box
	f.draw_boxes(ball, 'K[C]')
	f.draw_boxes(bin,  'K[M]')
	f.draw_boxes(bon,  'K[Y]')
	f.write "rings_intersection_separator_#{outer ? 'out' : 'in'}.png"
end
