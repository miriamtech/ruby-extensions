class Numeric
	def roundTo(precision)
		(self * 10 ** precision).round.to_f / (10 ** precision)
	end
	
	def niceString
		myString = self.to_s
		myString.match(/\./) ? myString.gsub(/\.0+$/, "") : myString
	end
end