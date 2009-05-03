require 'test/unit'
require 'lib/map'

module Anthill
  class MapTest < Test::Unit::TestCase
    def test_fill_map
      map = Map.new
      assert_equal 0, map.length

      o = Object.new
      map << o
      assert_equal map, o.map
      assert_equal Vector.new(0, 0), o.position
      assert_equal 1, map.length
      assert_equal 1, map.length(:Object)
      assert_equal 0, map.length(:Toto)
      assert_same o, map[][0]
      assert_same o, map[:Object][0]

      map >> o
      assert o.map.nil?
      assert_equal 0, map.length
      assert_equal 0, map.length(:Object)

      map.<<(o, [1, 7])
      assert_equal Vector.new(1, 7), o.position

      map << o
      assert_equal 1, map.length
      assert_equal 1, map.length(:Object)

      o2 = Object.new
      map << o2
      assert_equal 2, map.length
      assert_equal 2, map.length(:Object)
      assert_equal 0, map.length(:Toto)

      map >> o
      assert_equal 1, map.length
      assert_equal 1, map.length(:Object)
      assert_same o2, map[][0]
      assert_same o2, map[:Object][0]
    end
  end
end
