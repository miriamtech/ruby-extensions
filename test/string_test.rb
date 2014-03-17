require 'test/unit'
require File.dirname(__FILE__) + "/../string"
require File.dirname(__FILE__) + "/../numeric"

class StringTest < Test::Unit::TestCase
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
  def test_repeat
    assert_equal '***', '*'.repeat(3)
    assert_equal '*', '*'.repeat(1)
    assert_equal '', '*'.repeat(0)
  end
  def test_cutMiddle
    assert_equal 'Kyle', 'Kyle'.cutMiddle(4)
    assert_equal 'K...sting', 'Kyle Testing'.cutMiddle(9)
    assert_equal 'Ky...ng', 'Kyle Testing'.cutMiddle(7, 2)
    assert_equal '_show...a.rhtml', '_showAttachedPicturesasdffdsaasdffda.rhtml'.cutMiddle(15, 7)
    assert_equal 'T...g', 'ThisIsNotWorking'.cutMiddle(5)
    assert_equal 'T...g', 'ThisIsNotWorking'.cutMiddle(1)
  end
  def test_truncateToWordWithEllipsis
    assert_equal 'I like…', 'I like chicken, I like liver, meow mix, meow mix, please deliver'.truncateToWordWithEllipsis(12)
    assert_equal 'I like…', 'I like chicken, I like liver, meow mix, meow mix, please deliver'.truncateToWordWithEllipsis(9)
    assert_equal 'I like chicken…', 'I like chicken, I like liver, meow mix, meow mix, please deliver'.truncateToWordWithEllipsis(16)
  end
  def test_trim
    self.assert_equal '', "\302\240".trim
    self.assert_equal 'testing 1, 2, 3', '    testing 1, 2, 3 '.trim    
    self.assert_equal 'testing 1, 2, 3', "\t\ttesting 1, 2, 3\t  \t".trim
    self.assert_equal 'testing 1, 2, 3', "testing 1, 2, 3\n".trim
  end
  def test_prune
    self.assert_equal 'testing 1, 2, 3', '    testing 1, 2, 3 '.trim    
    self.assert_equal 'testing 1, 2, 3', "\t\ttesting 1, 2, 3\t  \t".trim
    self.assert_equal 'testing 1, 2, 3', "testing 1, 2, 3\n".trim
    self.assert_equal nil, ''.prune
    self.assert_equal nil, ' '.prune
    self.assert_equal nil, "\t".prune
    self.assert_equal nil, "\302\240".prune
  end

  def test_format_as_concise_number
    assert_equal '1.2', '1.20'.format_as_concise_number
    assert_equal '1', '1.00'.format_as_concise_number
    assert_equal '1,000', '1,000.00'.format_as_concise_number
    assert_equal '0.03344995', '3.344995E-02'.format_as_concise_number
    assert_equal '0.0001', '1.0000e-04'.format_as_concise_number
    assert_equal '1.0e-08', '1.0e-08'.format_as_concise_number
  end
  def test_format_as_concise_number_doesnt_touch_what_it_doesnt_know
    assert_equal 'One thousand.00', 'One thousand.00'.format_as_concise_number
  end
  def test_format_as_concise_number_significant_digits
    assert_equal '10.45', '10.450'.format_as_concise_number(:significant_digits => 5)
    assert_equal '10.456', '10.456'.format_as_concise_number(:significant_digits => 5)
    assert_equal '10.457', '10.456789'.format_as_concise_number(:significant_digits => 5)
    assert_equal '10.46', '10.456789'.format_as_concise_number(:significant_digits => 4)
    assert_equal '0.0334', '0.03344995'.format_as_concise_number(:significant_digits => 5)
    assert_equal '0.033', '0.03344995'.format_as_concise_number(:significant_digits => 4)
  end
  def test_format_as_concise_number_places
    assert_equal '10.45', '10.450'.format_as_concise_number(:places => 5)
    assert_equal '10.456', '10.456'.format_as_concise_number(:places => 5)
    assert_equal '10.45679', '10.456789'.format_as_concise_number(:places => 5)
    assert_equal '10.4568', '10.456789'.format_as_concise_number(:places => 4)
    assert_equal '0.03345', '0.03344995'.format_as_concise_number(:places => 5)
    assert_equal '0.0334', '0.03344995'.format_as_concise_number(:places => 4)
  end
  def test_format_as_concise_number_improper_options
    assert_raise(RuntimeError) { '10.450'.format_as_concise_number(:foo => 5) }
    assert_raise(RuntimeError) { '10.450'.format_as_concise_number(:significant_digits => 4, :places => 4) }
  end
end
