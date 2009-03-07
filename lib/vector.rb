module Anthill
  class Vector
    attr_reader :x, :y

    def initialize x = 0, y = 0
      @x = x
      @y = y
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

    def radius
      Math.sqrt(@x**2 + @y**2)
    end
  end
end
