module MyEnumerable
  # filter method
  def filter(&block)
    ans = []
    each do |items|
      ans << items if block.call(items) == true
    end
    ans
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
