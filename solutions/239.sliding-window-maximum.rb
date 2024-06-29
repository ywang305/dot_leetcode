# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer[]}
def max_sliding_window(nums, k)
  ans = []
  stack = [] # [[val, index], ...]
  nums.each.with_index do |n, i|
    stack.pop until stack.empty? || stack.last[0] > n
    stack << [n, i]
    if i >= k - 1
      stack.shift if i >= k && stack.first[1] == i - k
      ans << stack.first[0]
    end
  end
  ans
end
