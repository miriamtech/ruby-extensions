module Enumerable
	def sum
		self.inject(0) { |sum, each| sum + (block_given? ? yield(each) : each) }
	end
end