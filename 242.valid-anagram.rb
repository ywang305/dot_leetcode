#
# @lc app=leetcode id=242 lang=ruby
#
# [242] Valid Anagram
#

# @lc code=start
# @param {String} s
# @param {String} t
# @return {Boolean}
def is_anagram(s, t)
    s.chars.group_by(&:itself) == t.chars.group_by(&:itself)
end
# @lc code=end

