require 'test/unit'
require 'lib/sugar'

module Anthill
  class SugarTest < Test::Unit::TestCase
    def test_sugar_positioned
      assert Sugar.include? Positioned
    end

    def test_new_sugar
      s = Sugar.new(Vector.new(3, -5), 17)
      assert_equal Vector.new(3, -5), s.position
      assert_equal 17, s.drops
    end
  end
end
