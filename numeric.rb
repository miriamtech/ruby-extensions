class Numeric
	def roundTo(precision)
		(self * 10 ** precision).round.to_f / (10 ** precision)
	end
end