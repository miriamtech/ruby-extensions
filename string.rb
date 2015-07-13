class String
	def currencyAsFloat
		matchData = self.match(/^[$]?[ ]?(([\d]{1,3}[,]?)+)([\.]([\d]{1,2})?)?$/)
		return nil if matchData.nil?
		return (matchData[1].to_s + matchData[3].to_s).gsub(',', '').to_f
	end
	
	def isValidCurrency
		return !self.currencyAsFloat.nil?
	end
	
	def xmlEscapeUTF8
		self.gsub(Regexp.new('([\xc0-\xdf][\x80-\xbf])|([\xe0-\xef][\x80-\xbf]{2})|([\xf0-\xf7][\x80-\xbf]{3})')) do
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
	
	def truncateWithEllipsis(n, options={})
	  return self if self.size <= n
	  return self[0..n-1].strip + (options[:usePeriods] ? '...' : '…')
  end
	def truncateToWordWithEllipsis(n, options={})
	  return self if self.size <= n
    keptWords = []
    allWords = self.split(/ +/)
    allWords.each do |word|
      if (keptWords + [word]).join(' ').size > n - 1
        break
      end
      keptWords << word
    end
    return keptWords.join(' ').gsub(/[- ,.]+$/, '') + (options[:usePeriods] ? '...' : '…')
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
    # "a fellow named anthony struggles to program"
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
          lastBreakpoint = possibleBreakpoint + 1
          currentWordSize = i - possibleBreakpoint
          possibleBreakpoint = nil
        else
          newString += self[lastBreakpoint..i] + "\n"
          lastBreakpoint = i + 1
          currentWordSize = 0
        end
      end
      i += 1
    end
    newString += self[lastBreakpoint..self.size]
    return newString.gsub(/\n /, "\n").gsub(/\n+/, "\n")
  end
  
  def repeat (times)
    newString = ''
    times.times do
      newString += self
    end
    return newString
  end
  
  def cutMiddle(limit, tailSize=5)
    if self.length > limit
      if limit <= (tailSize + 3)
        tailSize = limit - 3
      end
      headSize = limit - tailSize - 3 # 3 extra for the ellipses generated.
      if headSize <= 0
        makeup = (-headSize / 2.0).ceil

        headSize = tailSize - makeup
        if headSize <= 0
          headSize = tailSize =  1
        end

        if limit < (headSize + 3 + tailSize)
          headSize = tailSize = 1
        end
      end
    	return self[0, headSize] + '...' + self[-tailSize, tailSize]
    else
    	return self
    end
  end
  
  def trim
    self.gsub("\302\240", "").gsub(/(^\s+|\s+$)/, '')
  end

  def prune
    stripped = self.trim
    if stripped.empty?
      nil
    else
      stripped
    end
  end

  def format_as_concise_number
    self.match(/\./) ? self.gsub(/\.0+$/, "") : self.clone    
  end
end