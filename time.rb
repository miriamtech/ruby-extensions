class Time
  public
  def to_date
    return Date.new(self.year, self.month, self.day)
  end

  def days_in_month
    return self.to_date.days_in_month
  end

  def beginning_of_week
    return self.to_date.beginning_of_week
  end
end
