#
# @lc app=leetcode id=231 lang=ruby
#
# [231] Power of Two
#

# @lc code=start
# @param {Integer} n
# @return {Boolean}
def is_power_of_two(n)
  n.positive? && n & (n - 1) == 0
end
# @lc code=end
