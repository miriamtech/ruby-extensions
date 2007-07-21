require 'test/unit'
require File.dirname(__FILE__) + "/../enumerable.rb"

class EnumerableTest < Test::Unit::TestCase
	def test_catalog
		result = ["A", "BCD", "EFGHIJK"].catalog { |each| [each.size, each.reverse] }
		assert_equal 1, result["A"].first
		assert_equal "A", result["A"].last
		assert_equal 3, result["BCD"].first
		assert_equal 7, result["EFGHIJK"].first
	end
end
