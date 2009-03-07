require 'test/unit'
require 'lib/positioned'

module Anthill
  class PositionedTest < Test::Unit::TestCase
    def test_position_incorrect
      o = Object.new
      o.extend Positioned
      assert_raises(ArgumentError) { o.position = :blah }
    end

    def test_position_vector
      o = Object.new
      o.extend Positioned
      o.position = Vector.new(4, -1)
      assert_equal Vector.new(4, -1), o.position
    end
  end
end
