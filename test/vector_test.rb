require 'test/unit'
require 'lib/vector'

module Anthill
  class VectorTest < Test::Unit::TestCase
    def test_new_nil_vector
      v = Vector.new
      assert_equal 0, v.x
      assert_equal 0, v.y
    end

    def test_new_vector
      v = Vector.new 1, 2
      assert_equal 1, v.x
      assert_equal 2, v.y
    end

    def test_equals
      v1 = Vector.new 1, 3
      v2 = Vector.new 1, 3
      v3 = Vector.new 2, 3
      assert_equal v1, v2
      assert_not_equal v1, v3
    end

    def test_plus
      v1 = Vector.new(2, 3) + Vector.new(-3, 5)
      v2 = Vector.new -1, 8
      assert_equal v2, v1
    end

    def test_minus
      v1 = Vector.new(4, -2) - Vector.new(1, 6)
      v2 = Vector.new 3, -8
      assert_equal v2, v1
    end

    def test_length
      v = Vector.new 3, -4
      assert_equal 5, v.length
    end
  end
end
