#
# @lc app=leetcode id=22 lang=ruby
#
# [22] Generate Parentheses
#

# @lc code=start
# @param {Integer} n
# @return {String[]}
def generate_parenthesis(n)
  res = []
  backtrack = lambda { |path, left, right|
    return unless left >= right && left <= n
    return res << path.dup if left == n && right == n

    backtrack.call(path << '(', left + 1, right)
    path.chop!
    backtrack.call(path << ')', left, right + 1)
    path.chop!
  }
  backtrack.call('', 0, 0)
  res
end
# @lc code=end

generate_parenthesis(3)
