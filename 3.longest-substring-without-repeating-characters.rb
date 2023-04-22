#
# @lc app=leetcode id=3 lang=ruby
#
# [3] Longest Substring Without Repeating Characters
#

# @lc code=start
# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
  memo = {}
  max = 0
  start = 0
  s.each_char.with_index do |c, i|
    start = memo[c]+1 if memo.key?(c) && memo[c]>=start
    max = i-start+1 if i-start+1 > max
    memo[c] = i
  end
  max
end
# @lc code=end
