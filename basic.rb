# require 'algorithms'
# include Containers
#
## -- test Containers::PriorityQueue  --
# Person = Data.define(:name, :age)
# persons = [Person.new(name: 'Zhang', age: 50), Person.new(name: 'Wang', age: 60), Person.new(name: 'Brad', age: 9)]
# pq = PriorityQueue.new do |f1, f2|
#   f1 <=> f2
# end
#
# persons.each do |per|
#   pq.push(per, per.age) # per.age -> field in comparator
# end
#
# puts pq.pop, pq.pop, pq.pop
## -- end --

## binary search basic
def binary_search(nums, target)
  i = 0
  j = nums.length - 1
  while i <= j
    m = i + (j - i) / 2
    if nums[m] < target
      i = m + 1
    elsif nums[m] > target
      j = m - 1
    else
      return m
    end
  end
end
# puts found = binary_search([1,2,4,6,7,8,9], 8)

def binary_search_first(nums, target)
  i = 0
  j = nums.length - 1
  while i <= j
    m = i + (j - i) / 2
    if nums[m] < target
      i = m + 1
    elsif nums[m] > target
      j = m - 1
    else
      found = m
      j = m - 1
    end
  end
  found
end
# puts found = binary_search_first([1, 2, 3, 4, 4, 4, 4, 5, 5, 6, 6, 7], 4) # 3

def binary_search_last(nums, target)
  i = 0
  j = nums.length - 1
  while i <= j
    m = i + (j - i) / 2
    if nums[m] < target
      i = m + 1
    elsif nums[m] > target
      j = m - 1
    else
      found = m
      i = m + 1
    end
  end
  found
end
# puts found = binary_search_last([1, 2, 3, 4, 4, 4, 4, 5, 5, 6, 6, 7], 4) # 6

def binary_search_lower(nums, target)
  i = 0
  j = nums.length - 1
  while i <= j
    m = i + (j - i) / 2
    if nums[m] < target
      found = m
      i = m + 1
    else
      j = m - 1
    end
  end
  found
end
# puts found = binary_search_lower([1, 2, 2, 2, 3, 4, 5, 5, 5, 6], 6) # 8

def binary_search_higher(nums, target)
  i = 0
  j = nums.length - 1
  while i <= j
    m = i + (j - i) / 2
    if nums[m] <= target
      i = m + 1
    else
      found = m
      j = m - 1
    end
  end
  found
end
# puts found = binary_search_higher([1, 2, 3, 4, 4, 4, 5, 5, 6], 4) # 6


class Trie
  attr_accessor :is_end

  def initialize = @data = {}
  def [](key) = @data[key]
  def []=(key, value)
    @data[key] = value
  end

  def insert(chars)
    node = self
    for c in chars
      node[c] ||= Trie.new
      node = node[c]
    end
    node.is_end = true
  end

  def has(chars)
    node = self
    for c in chars
      return false unless node[c]
      node = node[c]
    end
    !!node.is_end
  end

  def prefix(chars)
    node = self
    for c in chars
      return false unless node[c]
      node = node[c]
    end
    true
  end
end

# trie = Trie.new
# trie.insert(["a", "b", "c"])
# puts trie.has(["a", "b", "c"]), trie.has(["a", "b"])
# puts trie.prefix(["a", "b", "c"]), trie.prefix(["a", "b", "a"])
