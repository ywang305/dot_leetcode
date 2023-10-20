#
# @lc app=leetcode id=20 lang=ruby
#
# [20] Valid Parentheses
#

# @lc code=start
# @param {String} s
# @return {Boolean}
def is_valid(s)
  stack = []
  lefts = ['(', '[', '{']
  rights = [')', ']', '}']
  s.each_char do |c|
    if lefts.include?(c)
      stack << c
    elsif rights.include?(c)
      left = stack.pop
      return false unless lefts.index(left) == rights.index(c)
    end
  end
  stack.empty?
end
# @lc code=end
