#
# @lc app=leetcode id=16 lang=ruby
#
# [16] 3Sum Closest
#

# @lc code=start
# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def three_sum_closest(nums, target)
  nums.sort!
  closest = nums[0] + nums[1] + nums[2]
  (0..nums.size - 3).each do |i|
    left = i + 1
    right = nums.size - 1
    while left < right
      sum = nums[i] + nums[left] + nums[right]
      return sum if sum == target

      sum < target ? left += 1 : right -= 1

      closest = sum if (sum - target).abs < (closest - target).abs
    end
  end
  closest
end
# @lc code=end
