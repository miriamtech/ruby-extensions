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
	def characterWrap (n)
	  newString = ''
	  start = 0
	  while start + n < self.size
	    newString += "#{self[start..start + n - 1]}\n"
	    start += n
    end
    newString += self[start..self.size]
  end
  def wordWrap (maxWordSize)
    newString = ''
    lastBreakpoint = 0
    possibleBreakpoint = nil
    i = 0
    currentWordSize = 0
    while i < self.size
      currentWordSize += 1
      if self[i..i] == ' '
        possibleBreakpoint = i
      end
      if currentWordSize == maxWordSize
        if possibleBreakpoint
          newString += self[lastBreakpoint..possibleBreakpoint - 1] + "\n"
          lastBreakpoint = i + 1
          possibleBreakpoint = nil
        else
          newString += self[lastBreakpoint..i] + "\n"
          lastBreakpoint = i + 1
        end
        currentWordSize = 0
      end
      i += 1
    end
    newString += self[lastBreakpoint..self.size]
    return newString.gsub(/\n /, "\n")
  end
end