module MyEnumerable
  # filter method
  def filter(&block)
    result = []
    each do |items|
      result << items if block.call(items) == true
    end
    result
  end

  # any method
  def any?(&block)
    each do |items|
      return true if block.call(items) == true
    end
    false
  end

  # all method
  def all?(&block)
    each do |items|
      return false if block.call(items) == false
    end
    true
  end
end
