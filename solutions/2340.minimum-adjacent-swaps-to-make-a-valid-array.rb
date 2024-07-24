# @param {Integer[]} nums
# @return {Integer}
def minimum_swaps(nums)
  min, max = nums.minmax
  first_min_index = nums.index(min)
  last_max_index = nums.rindex(max)
  ans = nums.size - 1 - last_max_index + first_min_index
  ans -= 1 if first_min_index > last_max_index
  ans
end
