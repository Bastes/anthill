=begin rdoc
=Position handling
Gives an element a positon.
=end
module Anthill
  module Positioned
    attr_reader :position

    # a position must be a vector
    def position= vector
      raise ArgumentError.new("#{vector} should be a vector") unless vector.is_a? Vector
      @position = vector
    end
  end
end
