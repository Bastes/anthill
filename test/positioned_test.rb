require 'test/unit'
require 'lib/positioned'

module Anthill
  class PositionedTest < Test::Unit::TestCase
    def make_positionned
      o = Object.new
      o.extend Positioned
      o
    end

    def test_position_incorrect
      o = make_positionned
      assert_raises(ArgumentError) { o.position = :blah }
    end

    def test_position_correct
      o = make_positionned

      o.position = Vector.new(4, -1)
      assert o.position == [4, -1]

      o.position = -6, 2
      assert o.position == [-6, 2]

      o.position = [2, 3]
      assert o.position == [2, 3]
    end

    def test_map_incorrect
      o = make_positionned
      assert_raises(ArgumentError) { o.map = :blah }
    end

    def test_map_correct
      o = make_positionned

      m =  Map.new
      o.map = m
      assert o.map == m
    end
  end
end
