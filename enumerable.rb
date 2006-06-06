module Enumerable
	def catalog(&block)
		hashBuilder = self.collect { |each| [each, yield(each)] }.flatten 
		Hash[*hashBuilder]
	end
	
	def sum
		self.inject(0) { |sum, each| sum + (block_given? ? yield(each) : each) }
	end
end