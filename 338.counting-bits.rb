#
# @lc app=leetcode id=338 lang=ruby
#
# [338] Counting Bits
#

# @lc code=start
# @param {Integer} n
# @return {Integer[]}
def count_bits(n)
  ans = [0]
  (1..n).each do |i|
    ans << ans[i & (i - 1)] + 1
  end
  ans
end
# @lc code=end
