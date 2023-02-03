require_relative './enumerable'

class MyList
  include MyEnumerable

  def initialize(*list_arg)
    @list = list_arg.flatten
  end

  def each
    return to_enum(:each) unless block_given?

    counter = 0
    while counter < @list.length
      yield(@list[counter])
      counter += 1
    end
    @list
  end
end

list = MyList.new(1, 2, 3, 4)

# Test #all?
p(list.all? { |e| e < 5 })
# => true
p(list.all? { |e| e > 5 })
# => false

# Test #any?
p(list.any? { |e| e == 2 })
# => true
p(list.any? { |e| e == 5 })
# => false

# Test #filter
p(list.filter(&:even?))
# => [2, 4]
