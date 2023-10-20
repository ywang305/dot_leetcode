#
# @lc app=leetcode id=33 lang=ruby
#
# [33] Search in Rotated Sorted Array
#

# @lc code=start
# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search(nums, target)
  i = 0
  j = nums.length-1
  while i <= j
    m = i + (j-i)/2
    return m if nums[m] == target
    if nums[m] >= nums[i]
      nums[i] <= target && target < nums[m] ? j = m-1 : i = m+1
    else
      nums[m] < target && target <= nums[j] ? i = m+1 : j = m-1
    end
  end
  -1
end
# @lc code=end

