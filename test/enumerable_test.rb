require 'test/unit'
require File.dirname(__FILE__) + "/../lib/enumerable.rb"

class EnumerableTest < Test::Unit::TestCase
	def test_sum
		assert_equal 38, [1, 5, 9, 23].sum
		assert_equal 10, (1..4).sum
	end
	
	def test_sum_withBlock
		assert_equal 12, [1, 5].sum { |each| each * 2 }
	end
end
