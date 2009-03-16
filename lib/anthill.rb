=begin rdoc
=The Anthill, where ants feels at home
=end
module Anthill
  class Anthill
    include Positioned

    def initialize position
      self.position = position
    end
  end
end
