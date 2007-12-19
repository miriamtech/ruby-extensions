require 'test/unit'
require 'date'
require File.dirname(__FILE__) + '/../date_extensions'

class DateTest < Test::Unit::TestCase
  def testDaysInMonth
    assert_equal 31, Date.new(2007, 1, 1).daysInMonth
    assert_equal 28, Date.new(2007, 2, 1).daysInMonth
    assert_equal 30, Date.new(2007, 9, 1).daysInMonth
  end
end
