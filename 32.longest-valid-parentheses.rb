#
# @lc app=leetcode id=32 lang=ruby
#
# [32] Longest Valid Parentheses
#

# @lc code=start
# @param {String} s
# @return {Integer}
def longest_valid_parentheses(s)
  # stack based solution , e.g.  ((()()
  res = 0
  stack = []
  start = 0
  s.each_char.with_index do |c, i|
    if c == '('
      stack << i
    elsif stack.empty?
      start = i + 1
    else
      stack.pop # tricky 扔掉匹配的左括号坐标
      res = if stack.empty?
              [res, i - start + 1].max
            else
              [res, i - stack.last].max # 这里很 trick，匹配的左括号坐标的前一个
              # (       (           ( ) ( )
              # ^start  ^stack.last
            end
    end
  end
  res
end
# @lc code=end
