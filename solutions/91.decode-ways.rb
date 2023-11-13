# @param {String} s
# @return {Integer}
def num_decodings(s)
  return 0 if s[0]=='0'

  dp = [1]
  (1...s.length).each do |i|
    dp[i] = 0
    dp[i] = dp[i-1] if s[i] != '0'
    two_digits = s[i-1, 2].to_i
    dp[i] += (i-2 < 0) ? 1 : dp[i-2] if two_digits >= 10 && two_digits <= 26
  end

  dp.last
end
