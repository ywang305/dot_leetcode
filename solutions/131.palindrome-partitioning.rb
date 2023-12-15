#
# @lc app=leetcode id=131 lang=ruby
#
# [131] Palindrome Partitioning
#

# @lc code=start
# @param {String} s
# @return {String[][]}
def partition(s)
  len = s.length
  dp = Array.new(len){[]}
  len.times do |j|
    j.downto(0) do |i|
      dp[i][j] = s[i] == s[j] && (j-i<=2 || dp[i+1][j-1])
    end
  end

  res = []
  tmp = []
  dfs = lambda do |left|
    return res << tmp.dup if left==len

    (left...len).each do |right|
      if dp[left][right]
        tmp << s[left..right]
        dfs.call(right+1)
        tmp.pop
      end
    end
  end
  dfs.call(0)
  res
end
# @lc code=end
