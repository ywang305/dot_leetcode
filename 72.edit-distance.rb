#
# @lc app=leetcode id=72 lang=ruby
#
# [72] Edit Distance
#

# @lc code=start
# @param {String} word1
# @param {String} word2
# @return {Integer}
def min_distance(word1, word2)
  m = word1.length
  n = word2.length
  dp = []
  (0..m).each do |i|
    (0..n).each do |j|
      (dp[i] ||= [])[j] = if i.zero?
                            j
                          elsif j.zero?
                            i
                          elsif word1[i - 1] == word2[j - 1]
                            dp[i - 1][j - 1]
                          else
                            [dp[i - 1][j - 1], dp[i - 1][j], dp[i][j - 1]].min + 1
                          end
    end
  end
  dp[m][n]
end
# @lc code=end
