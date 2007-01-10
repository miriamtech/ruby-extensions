require 'test/unit'
require File.dirname(__FILE__) + "/../string.rb"

class NumericTest < Test::Unit::TestCase
	def test_xmlEscapeUTF8
		# Two-byte
		assert_equal '&#1488;', "א".xmlEscapeUTF8
		# Three byte
		assert_equal '&#8364;', "€".xmlEscapeUTF8
		# Four byte
		assert_equal '&#66560;', "\360\220\220\200".xmlEscapeUTF8
	end
end
