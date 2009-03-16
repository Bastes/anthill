=begin rdoc
=The Ant, a plucky little creature of the earth
=end
module Anthill
  class Ant
    include Positioned

    attr_reader :anthill

    def initialize anthill, position
      raise ArgumentError.new "#{anthill} should be an anthill." unless anthill.is_a? Anthill
      self.position = position
      @anthill = anthill
    end
  end
end
