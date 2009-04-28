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
      v = Vector.new 1, 3
      assert v == Vector.new(1, 3)
      assert v == [1, 3]
      assert v != Vector.new(2, 3)
      assert v != [2, 3]
    end

    def test_like
      v = Vector.new 2, 5
      assert ! v.is_like?([-1, 5])
      assert v.is_like?([2, 5])
      assert v.is_like?([2.001, 4.999])
      assert ! v.is_like?([2, 4.998])
      assert v.is_like?([2.1, 4.9], 0.1)
      assert ! v.is_like?([2.2, 4.9], 0.1)
    end

    def test_addition
      v1 = Vector.new(2, 3) + Vector.new(-3, 5)
      v2 = Vector.new(-1, 8)
      assert_equal v2, v1
    end

    def test_substraction
      v1 = Vector.new(4, -2) - Vector.new(1, 6)
      v2 = Vector.new 3, -8
      assert_equal v2, v1
    end

    def test_product
      v = Vector.new(1, -5)
      assert_equal Vector.new(2, -10), v * 2
      assert_equal 0, v * [5, 1]
      assert_equal(-13, v * Vector.new(2, 3))
    end

    def test_length
      assert_equal(5, Vector.new(3, -4).length)
    end
    
    def test_resize
      assert_equal(Vector.new(3, 4), Vector.new(6, 8) << 5)
    end

    def test_angle
      assert_equal 0, Vector.new.angle
      assert_equal 0, Vector.new(7, 0).angle
      assert_equal 1, Vector.new(-2, 0).angle
      assert_equal 1.0 / 2, Vector.new(0, 8).angle
      assert_equal((-1.0 / 2), Vector.new(0, -5).angle)
      assert_equal 1.0 / 2, Vector.new(0, 8).angle
      assert_equal((-1.0 / 2), Vector.new(0, -5).angle)
      assert_equal 1.0 / 4, Vector.new(6, 6).angle
      assert_equal 3.0 / 4, Vector.new(-7, 7).angle
      assert_equal((-1.0 / 4), Vector.new(3, -3).angle)
      assert_equal((-3.0 / 4), Vector.new(-8, -8).angle)
    end

    def test_reorient
      v = Vector.new(1, 0)
      assert Vector.new(0, 1).is_like?(v / (1.0 / 2))
      assert Vector.new(-1, 0).is_like?(v / 1)
      assert Vector.new(0, -1).is_like?(v / (3.0 / 2))
      assert Vector.new(1, 0).is_like?(v / 2)
    end
  end
end
