#
# @lc app=leetcode id=69 lang=ruby
#
# [69] Sqrt(x)
#

# @lc code=start
# @param {Integer} x
# @return {Integer}
def my_sqrt(x)
  i = 0
  j = x
  res = 0
  while i <= j
    m = (i + j) / 2
    mm = m * m
    if mm < x
      i = m + 1
      res = m
    elsif mm > x
      j = m - 1
    else
      res = m
      break
    end
  end
  res
end
# @lc code=end
