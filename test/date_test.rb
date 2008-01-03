require 'test/unit'
require 'date'
require File.dirname(__FILE__) + '/../date_extensions'

class DateTest < Test::Unit::TestCase
  def test_days_in_month
    assert_equal 31, Date.new(2007, 1, 1).days_in_month
    assert_equal 28, Date.new(2007, 2, 1).days_in_month
    assert_equal 30, Date.new(2007, 9, 1).days_in_month
  end
  def test_beginning_of_week
    assert_equal Date.new(2007, 12, 30), Date.new(2008, 1, 3).beginning_of_week
    assert_equal Date.new(2008, 1, 6), Date.new(2008, 1, 12).beginning_of_week
  end
end
