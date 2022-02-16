#! /usr/bin/env ruby

require 'p1788'
include P1788

module EZ_INTERVALS
    module EZ_TYPES
        class Disk
            attr_reader :center # return Array[x, y]
            attr_reader :radius # return Interval
            def initialize(x, y, r)
                @center = [x, y]
                @radius = r
            end
        end
    end
end


