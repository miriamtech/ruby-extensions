class Date
  def days_in_month
    d, m, y = mday, month, year
    d += 1 while Date.valid_civil?(y, m, d)
    d - 1
  end
  def beginning_of_week
    self - self.wday
  end
  def add_months(integer)
    year = self.year
    month = self.month + integer
    day = self.mday
    if month > 12
      year = year + month / 12
      month = month - 12
    end
    begin
      return Date.new(year, month, day)
    rescue ArgumentError
      return Date.new(year, month, Date.new(year, month, 1).days_in_month)
    end
  end
end