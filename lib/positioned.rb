require 'lib/vector'

=begin rdoc
=Position handling
Gives an element a positon.
=end
module Anthill
  module Positioned
    attr_reader :map, :position

    # a position must describe a vector
    def position= *args
      if args.first.is_a? Vector
        vector = args.first
      else
        vector = Vector.new(args)
      end
      @position = vector
    end

    # a map must be a map (really)
    def map= value
      raise ArgumentError.new("#{value} is not a map.") unless value.nil? or value.is_a? Map
      @map = value
    end
  end
end
