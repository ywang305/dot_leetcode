# @param {String} s
# @param {String} t
# @return {Integer}
def num_distinct(s, t)
  s = ' ' + s
  t = ' ' + t
  dp = Array.new(s.length) {[]}
  dp[0][0] = 1
  (1...s.length).each { dp[_1][0] = 1 }
  (1...t.length).each { dp[0][_1] = 0 }

  (1...s.length).each do |i|
    (1...t.length).each do |j|
      dp[i][j] = dp[i-1][j]
      dp[i][j] += dp[i-1][j-1] if s[i] == t[j]
    end
  end

  dp.last.last
end
