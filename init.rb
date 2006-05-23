module Enumerable
	def sum
		self.inject(0) { |sum, each| sum + each }}
	end
end
