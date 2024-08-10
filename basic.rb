#   bundle install && bundle exec irb
#
#   require 'algorithms'
#   # [url](https://kanwei.github.io/algorithms)
#   include Containers
#
#   # -- test Containers::PriorityQueue  --
#   1. min-top heap
#         pq_min = PriorityQueue.new { _1 < _2 }
#         pq_min.push("Brad", 10)
#         pq_min.push("Yao", 10)
#         pq_min.next  # => peek "Brad"
#         pq_min.pop   # => remove and return "Brad"
#
#   2. max-top heap
#         pq_max = PriorityQueue.new { _1 > _2 }
#         pq_max.push("Brad", 10)
#         pq_max.push("Yao", 40)
#         pq_max.next  # => "Yao"

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
    else
      j = m - 1
      found = m if nums[m] == target
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
    if nums[m] <= target
      i = m + 1
      found = m if nums[m] == target
    else
      j = m - 1
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
#

# ==== quick sort  ====
def swap(list, i, j)
  list[i], list[j] = list[j], list[i]
end

# single pointer (easy to understand)
def quick_sort(list, s = 0, e = list.length - 1)
  return if s >= e

  p = s # boundary: from p all > pivot; before p all <= pivot
  pivot = list[e] # must be last to keep p-1 as pivot after last swap

  (s..e).each do |i|
    if list[i] <= pivot
      swap(list, i, p)
      p += 1
    end
  end

  quick_sort(list, s, p - 2) # exclude pivot (at index p-1), or might curse inifite recursion
  quick_sort(list, p, e)
end

def quick_sort_double_pointer(list, s = 0, e = list.length - 1)
  return if s >= e

  pivot = list[e]
  left = s
  right = e
  while left < right
    left += 1 while left < right && list[left] <= pivot # find an element > pivot
    right -= 1 while left < right && list[right] >= pivot # find an elment < pivot
    swap(list, left, right)
  end
  swap(list, left, e) # put the pivot into its final place
  quick_sort_double_pointer(list, s, left - 1)
  quick_sort_double_pointer(list, left + 1, e)
end

# ==== Trie tree ====
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

class UnionFind
  attr_reader :root

  def initialize = @root = {}

  def union(x, y)
    root_x = find(x)
    root_y = find(y)
    @root[root_y] = root_x unless root_x == root_y
  end

  def find(x)
    return x if (@root[x] ||= x) == x # create root for x if not exists

    find(@root[x])
  end
end
