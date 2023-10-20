#
# @lc app=leetcode id=53 lang=ruby
#
# [53] Maximum Subarray
#

# @lc code=start
# @param {Integer[]} nums
# @return {Integer}
def max_sub_array(nums)
  dp = [nums[0]]
  (1...nums.length).each do |i|
    dp[i] = [dp[i - 1] + nums[i], nums[i]].max
  end
  dp.max
end
# @lc code=end
