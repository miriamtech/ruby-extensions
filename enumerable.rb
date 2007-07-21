module Enumerable
	def catalog(&block)
		pairs = self.collect { |each| [each, yield(each)] }
		result = Hash.new
		pairs.each { |pair| result[pair.first] = pair.last }
		result
	end
end