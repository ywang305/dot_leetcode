#
# @lc app=leetcode id=5 lang=ruby
#
# [5] Longest Palindromic Substring
#

# @lc code=start
# @param {String} s
# @return {String}
def longest_palindrome(s)
  len = s.length
  dp = Array.new(len) { [] }
  lpd = ''
  (0..len - 1).each do |j|
    j.downto(0).each do |i|
      if s[i] == s[j] && (j - i <= 2 || dp[i + 1][j - 1])
        dp[i][j] = true
        lpd = s[i..j] if lpd.length < j - i + 1
      end
    end
  end
  lpd
end
# @lc code=end
