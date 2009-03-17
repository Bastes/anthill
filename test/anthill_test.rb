require 'test/unit'
require 'lib/anthill'

module Anthill
  class AnthillTest < Test::Unit::TestCase
    def test_anthill_positioned
      assert Anthill.include? Positioned
    end

    def test_new_anthill
      anthill = Anthill.new(Vector.new(-6, -4))
      assert_equal Vector.new(-6, -4), anthill.position
    end

    def test_add_new_ant
      anthill = Anthill.new(Vector.new(3, 2))
      ant = anthill.spawn_ant
      assert_equal Vector.new(3, 2), ant.position
    end
  end
end
