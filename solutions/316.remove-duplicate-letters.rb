#
# @lc app=leetcode id=316 lang=ruby
#
# [316] Remove Duplicate Letters
#

# @lc code=start
# @param {String} s
# @return {String}
def remove_duplicate_letters(s)
  stack = []
  freq = s.chars.tally
  memo = Set.new # 在stack上？
  s.chars.each do |c|
    unless memo.include?(c)
      memo.delete(stack.pop) while !stack.empty? && stack[-1] >= c && freq[stack[-1]] > 0
      stack << c
      memo.add(c)
    end
    freq[c] -= 1
  end
  stack.join
end
# @lc code=end

remove_duplicate_letters('cbacdcbc')
