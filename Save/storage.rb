class Storage
  def fetch
    raise Error 'Not implemented'
  end

  def save(_item)
    raise Error 'Not implemented'
  end

  def serialize(_item)
    raise Error 'Not implemented'
  end

  def deserialize(_item)
    raise Error 'Not implemented'
  end
end
