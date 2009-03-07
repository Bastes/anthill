=begin rdoc
=Simple vector class
=end
module Anthill
  class Vector
    # coordinates
    attr_reader :x, :y

    def initialize x = 0, y = 0
      @x = x.to_f
      @y = y.to_f
    end

    def == other
      @x == other.x and @y == other.y
    rescue
      false
    end

    def + other
      Vector.new @x + other.x, @y + other.y
    end

    def - other
      Vector.new @x - other.x, @y - other.y
    end

    def length
      Math.sqrt(@x**2 + @y**2)
    end
  end
end
