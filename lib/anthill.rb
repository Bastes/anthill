=begin rdoc
=The Anthill, where ants feels at home
=end
module Anthill
  class Anthill
    include Positioned

    def initialize position
      self.position = position
    end

    def spawn_ant
      Ant.new self, @position
    end
  end
end
