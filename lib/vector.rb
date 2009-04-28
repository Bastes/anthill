=begin rdoc
=Simple vector class
Supports most vector calculus :
- addition and substractions (+ -)
- product (*) scalar and vector's
- length manipulations
- angle manipulations (relative to [1, 0] counter-clockwise, multiple of Pi)
Operations between 2 vectors can take arguments written in various forms :
- Vector.new(1, 0) + Vector.new(2, 3)
- Vector.new(4, -5) - [-6, 7]
=end
module Anthill
  class Vector
    # Coordinates
    attr_reader :x, :y

    # Vector initialization
    def initialize *args
      args = args.flatten
      case args.length
        when 0: coordiates = [0, 0] 
        when 1: coordiates = [args[0].x, args[0].y]
        when 2: coordiates = args
        else raise ArgumentError.new
      end
      @x, @y = coordiates
    rescue
      raise ArgumentError.new "#{args} doesn't describe a vector."
    end

    # Vector comparisons
    def == *args
      other = self.class.convert(args)
      @x == other.x and @y == other.y
    end

    # Vector likeness (proximity of coordinates with a precision rate)
    def is_like? other, precision = 0.001
      other = self.class.convert(other)
      ((@x - precision)..(@x + precision)).include? other.x and
      ((@y - precision)..(@y + precision)).include? other.y
    end

    # Vector addition
    def + *args
      other = self.class.convert(args)
      Vector.new @x + other.x, @y + other.y
    end

    # Vector substraction
    def - *args
      other = self.class.convert(args)
      Vector.new @x - other.x, @y - other.y
    end

    # Vector product
    # Supports scalar by vector and vector by vector products.
    def * *args
      other = self.class.convert(args)
      @x * other.x + @y * other.y
    rescue
      value = args.first
      Vector.new(@x * value, @y * value)
    end

    # Vector resizing
    def << value
      self * (value / length)
    rescue
      Vector.new
    end

    # Vector's length
    def length
      Math.sqrt(@x**2 + @y**2)
    end

    # Angle modification
    def / value
      l = self.length
      a = value * Math::PI
      Vector.new(Math.cos(a) * l, Math.sin(a) * l)
    end

    # Vector's angle
    def angle
      return (@x < 0 ? 1 : 0) if @y == 0
      return (@y < 0 ? -1.0 / 2 : 1.0 / 2) if @x == 0
      return Math.atan(@y / @x) / Math::PI + ((@x > 0 ? 0 : 1) * (@y <=> 0))
    end

    private

    # Converts given arguments in a vector (if necessary)
    # The method is used by most vector's operators to get a proper vector
    # out of various ways of writing arguments.
    def self.convert *args # ::nodoc::
      return args.first if args.first.is_a?(Vector)
      Vector.new(args)
    end
  end
end
