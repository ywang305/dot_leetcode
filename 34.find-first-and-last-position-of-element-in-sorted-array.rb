#
# @lc app=leetcode id=34 lang=ruby
#
# [34] Find First and Last Position of Element in Sorted Array
#

# @lc code=start
# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def search_range(nums, target)
  lower_bound = begin
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
    found || -1
  end

  return [-1, -1] if lower_bound == -1 # cannot early return in begin ...end block

  higher_bound = begin
    i = lower_bound
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
  [lower_bound, higher_bound]
end
# @lc code=end

search_range([5,7,7,8,8,10], 8)
