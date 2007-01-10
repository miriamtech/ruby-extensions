class String
	def xmlEscapeUTF8
		self.gsub(/([\xc0-\xdf][\x80-\xbf])|([\xe0-\xef][\x80-\xbf]{2})|([\xf0-\xf7][\x80-\xbf]{3})/) do
			b2, b3, b4 = $1, $2, $3
			if b2
				value = ((b2[0] & 0x1F) << 6) + (b2[1] & 0x3f)
			elsif b3
				value = ((b3[0] & 0x0F) << 12) + ((b3[1] & 0x3f) << 6) + (b3[2] & 0x3f)
			elsif b4
				value = ((b4[0] & 0x07) << 17) + ((b4[1] & 0x3f) << 12) + ((b4[2] & 0x3f) << 6) + (b4[3] & 0x3f)
			end
			"&##{value};"
		end
	end
end