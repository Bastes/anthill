require 'test/unit'
require 'lib/ant'

module Anthill
  class AntTest < Test::Unit::TestCase
    def test_ant_positioned
      assert Ant.include? Positioned
    end

    def test_new_ant
      anthill = Anthill.new(Vector.new(3, 4))
      ant = Ant.new(Vector.new(7, -3), anthill)
      assert_equal Vector.new(7, -3), ant.position
      assert_equal anthill, ant.anthill
    end
  end
end
