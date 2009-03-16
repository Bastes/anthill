require 'test/unit'
require 'lib/sugar'

module Anthill
  class SugarTest < Test::Unit::TestCase
    def test_sugar_positioned
      assert Sugar.include? Positioned
    end

    def test_new_sugar
      s = Sugar.new 17
      assert_equal 17, s.drops
    end
  end
end
