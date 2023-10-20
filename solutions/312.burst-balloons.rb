#
# @lc app=leetcode id=312 lang=ruby
#
# [312] Burst Balloons
#

# @lc code=start
# @param {Integer[]} nums
# @return {Integer}
def max_coins(nums)
  nums.unshift(1).push(1)
  n = nums.length
  dp = Array.new(n) { Array.new(n, 0) }
  (n-1).downto(0) do |i|
    (i+1..n-1).each do |j|
      (i+1..j-1).each do |k|
        dp[i][j] = [dp[i][j], dp[i][k] + dp[k][j] + nums[i] * nums[k] * nums[j]].max
      end
    end
  end
  dp[0][n-1]
end
# @lc code=end
