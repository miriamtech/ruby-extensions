class NilClass
  def ifNil(&block)
    yield
  end

  def ifNotNil(&block)
  end

  def prune
    self
  end
end

class Object
  def ifNil(&block)
  end

  def ifNotNil(&block)
    yield self
  end
end
