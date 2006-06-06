require 'test/unit'
require File.dirname(__FILE__) + "/../enumerable.rb"

class EnumerableTest < Test::Unit::TestCase
	def test_catalog
		result = ["A", "BCD", "EFGHIJK"].catalog { |each| each.size }
		assert_equal 1, result["A"]
		assert_equal 3, result["BCD"]
		assert_equal 7, result["EFGHIJK"]
	end
	
	def test_sum
		assert_equal 38, [1, 5, 9, 23].sum
		assert_equal 10, (1..4).sum
	end
	
	def test_sum_withBlock
		assert_equal 12, [1, 5].sum { |each| each * 2 }
	end
end
