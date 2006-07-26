require 'test/unit'
require File.dirname(__FILE__) + "/../nil.rb"

class EnumerableTest < Test::Unit::TestCase
	def setup
		@nil = nil
		@notNil = 'Something'
	end

	def test_ifNil
		invoked = false
		@notNil.ifNil { invoked = true }
		assert !invoked
		@nil.ifNil { invoked = true }
		assert invoked
	end
	
	def test_ifNotNil
		invoked = false
		@nil.ifNotNil { invoked = true }
		assert !invoked
		@notNil.ifNotNil { invoked = true }
		assert invoked
	end
	
	def test_ifNotNil_withParameter
		parameter = nil
		@notNil.ifNotNil { |arg| parameter = arg }
		assert_equal @notNil, parameter
	end
end
