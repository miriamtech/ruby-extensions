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

  def test_sortCarefullyBy
    long = [
      {:i => 1, :name => 'Same'},
      {:i => 2, :name => 'Same'},
      {:i => 3, :name => 'Same'},
      {:i => 4, :name => 'Same'},
      {:i => 5, :name => 'Same'},
      {:i => 6, :name => 'Same'},
      {:i => 7, :name => 'Same'},
      {:i => 8, :name => 'Same'},
      {:i => 9, :name => 'Same'},
      {:i => 10, :name => 'Diff'},
      {:i => 11, :name => 'Same'},
      {:i => 12, :name => 'Same'}
      ]
    sorted = long.sortCarefullyBy { |each| each[:name] }
    assert_equal [10, 1, 2, 3, 4, 5, 6, 7, 8, 9, 11, 12], sorted.collect { |each| each[:i] }
    sorted = sorted.sortCarefullyBy { |each| each[:i] % 2 }
    assert_equal [10, 2, 4, 6, 8, 12, 1, 3, 5, 7, 9, 11], sorted.collect { |each| each[:i] }
  end

  def test_conjunct
    assert_equal 'Apples, Oranges and Pears', ['Apples', 'Oranges', 'Pears'].conjunct
    assert_equal 'Apples and Oranges', ['Apples', 'Oranges'].conjunct
    assert_equal 'Apples', ['Apples'].conjunct
    assert_equal '', [].conjunct
  end
end
