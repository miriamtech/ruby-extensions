class Time
  public
  def to_date
    return Date.new(self.year, self.month, self.day)
  end
end