#
# @lc app=leetcode id=7 lang=ruby
#
# [7] Reverse Integer
#

# @lc code=start
# @param {Integer} x
# @return {Integer}
def reverse(x, neg_flag = false)
  return reverse(-x, true) if x.negative?

  min_limit = -2**31
  max_limit = 2**31 - 1

  ans = 0
  until x.zero?
    return 0 if ans > max_limit / 10 || -ans < min_limit / 10

    new_ans = ans * 10 + x % 10
    # return 0 if new_ans / 10 != ans

    x /= 10
    ans = new_ans
  end
  neg_flag ? -ans : ans
end
# @lc code=end

reverse(123)
