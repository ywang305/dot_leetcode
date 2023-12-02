# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
  n = prices.length
  dp = Array.new(n) { [] }
  dp[0] = [-prices[0], 0, -prices[0], 0]
  (1...prices.length).each do |i|
    dp[i][0] = max(dp[i - 1][0], -prices[i])
    dp[i][1] = max(dp[i - 1][1], + prices[i] + dp[i - 1][0])
    dp[i][2] = max(dp[i - 1][2], - prices[i] + dp[i - 1][1])
    dp[i][3] = max(dp[i - 1][3], + prices[i] + dp[i - 1][2])
  end

  dp.last.last
end

def max(a, b) = [a, b].max
