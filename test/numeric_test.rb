require 'test/unit'
require File.dirname(__FILE__) + "/../numeric.rb"

class NumericTest < Test::Unit::TestCase
  def test_roundTo
    assert_equal 4.5, 4.51.roundTo(1)
    assert_equal 5, 4.51.roundTo(0)
    assert_equal 4.51, 4.51.roundTo(2)
  end

  def test_niceString
    assert_equal '4.5', 4.5.niceString
    assert_equal '4', 4.niceString
    assert_equal '4', (4.0).niceString
    assert_equal '-1.2', (-1.2000).niceString
  end
end
