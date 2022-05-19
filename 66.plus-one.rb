#
# @lc app=leetcode id=66 lang=ruby
#
# [66] Plus One
#

# @lc code=start
# @param {Integer[]} digits
# @return {Integer[]}
def plus_one(digits)
  res = []
  num = 1
  digits.reverse_each.with_index do |digit, _i|
    res << (digit + num) % 10
    num = (digit + num) / 10
  end
  res << num if num > 0
  res.reverse
end
# @lc code=end
