#
# @lc app=leetcode id=70 lang=ruby
#
# [70] Climbing Stairs
#

# @lc code=start
# @param {Integer} n
# @return {Integer}
def climb_stairs(n)
  return n if n <= 2

  dp = [1, 1, 2]
  (3..n).each do |i|
    dp[i] = dp[i - 1] + dp[i - 2]
  end
  dp[n]
end
# @lc code=end
