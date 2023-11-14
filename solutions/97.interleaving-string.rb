# @param {String} s1
# @param {String} s2
# @param {String} s3
# @return {Boolean}
def is_interleave(s1, s2, s3)
  m = s1.length
  n = s2.length
  return false if s3.length != m + n

  dp = Array.new(m+1) { [] }
  dp[0][0] = true

  (1..m).each { |i| dp[i][0] = dp[i-1][0] && s1[i-1]==s3[i-1] }
  (1..n).each { |i| dp[0][i] = dp[0][i-1] && s2[i-1]==s3[i-1] }

  (1..m).each do |i|
    (1..n).each do |j|
      dp[i][j] = (dp[i-1][j] && s3[i+j-1]==s1[i-1]) || (dp[i][j-1] && s3[i+j-1]==s2[j-1]) # s3[i+j-1] 不容易想到！
    end
  end
  dp.last.last == true
end
