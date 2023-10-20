#
# @lc app=leetcode id=131 lang=ruby
#
# [131] Palindrome Partitioning
#

# @lc code=start
# @param {String} s
# @return {String[][]}
def partition(s)
  dp = Array.new(s.length) { [] }
  s.length.times do |j|
    (0..j).each do |i|
      dp[i][j] = s[j] == s[i] && (j - i <= 2 || dp[i + 1][j - 1])
    end
  end

  res = []
  part = []
  dfs = lambda { |start|
    res << part.dup if start == s.length

    (start...s.length).each do |i|
      next unless dp[start][i]

      part.push s[start..i]
      dfs.call(i + 1)
      part.pop
    end
  }

  dfs.call(0)
  res
end
# @lc code=end

p partition('abbab')
