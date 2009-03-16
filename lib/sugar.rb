=begin rdoc
=Sugar, an ant's breakfast
=end
module Anthill
  class Sugar
    include Positioned

    # quantity of sugar
    attr_reader :drops

    def initialize position, drops
      self.position = position
      @drops = drops
    end
  end
end
