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

module EZ_INTERVALS
	module EZ_ALGORITHMS
		# Performs sivia algorithm using selected searchspace, threshold and contractor
		# params :
		# => initial_box : sivia searchspace (type IntervalVector)
		# => epsilon : bisection threshold (type float)
		# => contractor : contractor function pointer
		def sivia(initial_box, epsilon, &contractor)
			l = [initial_box] # The list of boxes initially contains only the initial box
			x_in = []
			x_on = []
			all_boxes = []
			until l.empty? do
				b = l.pop
				all_boxes << b
				cb, incl = contractor.call(b) # Contract b into cb. incl is true when cb is included in the contractor's set
				if cb.empty? then # Discard the box if it has been contracted to the empty box
					next
				elsif cb == b then # The box could not be contracted any more
					if incl then
						x_in << cb
					else
						if cb.max_width <= epsilon then # Stop bisecting if the box is smaller than epsilon
							x_on << cb
						else # Bisect the box for further processing
							l += cb.bisect
						end
					end
				else # The box has been contracted, we will try later to contract it again
					l << cb
				end
			end
			return [x_in, x_on, all_boxes]
		end
	end
end