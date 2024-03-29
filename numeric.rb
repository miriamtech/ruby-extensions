class Numeric
  def roundTo(precision)
    (self * 10 ** precision).round.to_f / (10 ** precision)
  end

  def niceString
    # Deprecated in favor of concisely
    concisely
  end

  def concisely
    self.to_s.format_as_concise_number
  end
end
