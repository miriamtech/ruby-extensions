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
	def test_characterWrap
    assert_equal "cha\nrac\nter\ns", 'characters'.characterWrap(3)
    assert_equal 'abc', 'abc'.characterWrap(3)
    assert_equal 'abc', 'abc'.characterWrap(5)
  end
  
  def test_wordWrap
    assert_equal "aaa\nbbbb\ncc", 'aaa bbbb cc'.wordWrap(4)
    assert_equal "a\nfello\nw\nnamed\nantho\nny\nstrug\ngles\nto\nprogr\nam", "a fellow named anthony struggles to program".wordWrap(5)
  end
  
  def test_cutMiddle
    assert_equal 'Kyle', 'Kyle'.cutMiddle(4)
    assert_equal 'K...sting', 'Kyle Testing'.cutMiddle(9)
    assert_equal 'Ky...ng', 'Kyle Testing'.cutMiddle(7, 2)
    assert_equal '_show...a.rhtml', '_showAttachedPicturesasdffdsaasdffda.rhtml'.cutMiddle(15, 7)
    assert_equal 'T...g', 'ThisIsNotWorking'.cutMiddle(5)
    assert_equal 'T...g', 'ThisIsNotWorking'.cutMiddle(1)
  end
end
