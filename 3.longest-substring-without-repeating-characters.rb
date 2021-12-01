#
# @lc app=leetcode id=3 lang=ruby
#
# [3] Longest Substring Without Repeating Characters
#

# @lc code=start
# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
  hash = {}
  max = 0
  start = 0
  s.each_char.with_index do |c, i|
    start = hash[c] + 1 if hash[c] && hash[c] >= start
    max = [max, i - start + 1].max
    hash[c] = i
  end
  max
end
# @lc code=end
