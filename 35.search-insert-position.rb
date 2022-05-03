#
# @lc app=leetcode id=35 lang=ruby
#
# [35] Search Insert Position
#

# @lc code=start
# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search_insert(nums, target)
  i = 0
  j = nums.size - 1
  res = -1
  while i <= j
    m = i + (j - i) / 2
    if nums[m] < target
      i = m + 1
      res = m
    else
      j = m - 1
    end
  end
  res + 1
end
# @lc code=end
