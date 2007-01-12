module Enumerable
	def catalog(&block)
		pairs = self.collect { |each| [each, yield(each)] }
		result = Hash.new
		pairs.each { |pair| result[pair.first] = pair.last }
		result
	end
	
	def sum
		self.inject(0) { |sum, each| sum + (block_given? ? yield(each) : each) }
	end
end