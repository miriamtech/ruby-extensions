module Enumerable
	def catalog(&block)
		pairs = self.collect { |each| [each, yield(each)] }
		result = Hash.new
		pairs.each { |pair| result[pair.first] = pair.last }
		result
	end
	
	def sortCarefullyBy(&block)
		self.sort do |a, b|
			resultA = block.call(a)
			resultB = block.call(b)
			comparisonResult = resultA <=> resultB
			if comparisonResult == 0
				self.index(a) <=> self.index(b)
			else
				comparisonResult
			end
		end
	end
	
	def conjunct
	  if self.size == 0
	    return ''
	  elsif self.size == 1
	    return self.first
	  else
	    string = self[0..-2].join(', ')
	    string += " and #{self[-1]}"
	    return string
    end
	end
end