#
# @lc app=leetcode id=1143 lang=ruby
#
# [1143] Longest Common Subsequence
#

# @lc code=start
# @param {String} text1
# @param {String} text2
# @return {Integer}
def longest_common_subsequence(text1, text2)
  dp = Array.new(text1.size + 1) { Array.new(text2.size + 1, 0) }
  text1.size.times do |i|
    text2.size.times do |j|
      dp[i + 1][j + 1] = if text1[i] == text2[j]
                           dp[i][j] + 1
                         else
                           [dp[i + 1][j], dp[i][j + 1]].max
                         end
    end
  end

  dp.last.last
end
# @lc code=end
