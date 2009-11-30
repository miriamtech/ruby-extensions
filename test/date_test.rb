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
  def test_add_months
    assert_equal Date.new(2009, 12, 30), Date.new(2009, 11, 30).add_months(1)
    assert_equal Date.new(2010, 11, 30), Date.new(2009, 11, 30).add_months(12)
    assert_equal Date.new(2009, 10, 30), Date.new(2009, 11, 30).add_months(-1)

    assert_equal Date.new(2009, 11, 30), Date.new(2009, 10, 31).add_months(1)
    assert_equal Date.new(2009, 2, 28), Date.new(2009, 1, 31).add_months(1)
  end
end
