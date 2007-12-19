class Date
  def daysInMonth
    d, m, y = mday, month, year
    d += 1 while Date.valid_civil?(y, m, d)
    d - 1
  end
end