#
# @lc app=leetcode id=49 lang=ruby
#
# [49] Group Anagrams
#

# @lc code=start
# @param {String[]} strs
# @return {String[][]}
def group_anagrams(strs)
  strs.group_by { |str| str.chars.sort }.values
end
# @lc code=end
