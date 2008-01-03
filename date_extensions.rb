class Date
  def days_in_month
    d, m, y = mday, month, year
    d += 1 while Date.valid_civil?(y, m, d)
    d - 1
  end
  def beginning_of_week
    self - self.wday
  end
end