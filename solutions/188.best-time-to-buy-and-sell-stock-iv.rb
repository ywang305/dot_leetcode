# @param {Integer} k
# @param {Integer[]} prices
# @return {Integer}
def max_profit(k, prices)
  len = prices.length
  dp = Array.new(len) do
    Array.new(k + 1) { State.new }
  end

  (0...k + 1).each do |act| # 0次交易只是概念上的存在，是初始化值，非合理存在，几交易次数应该是: 1次，2次，... k次, 所以 0...k+1
    dp[0][act].no_hold = 0
    dp[0][act].hold = -prices[0] # 第‘0’天 无论执行多少次交易(0...k+1),都是花掉这天买股票的钱。
  end

  (0...len).each do |day|
    dp[day][0].no_hold = 0
    dp[day][0].hold = -1e10
  end

  (1...len).each do |day|
    (1...k + 1).each do |act|
      today_price = prices[day]
      dp[day][act].no_hold = max(dp[day - 1][act].no_hold, dp[day - 1][act].hold + today_price)
      dp[day][act].hold = max(dp[day-1][act - 1].no_hold - today_price, dp[day - 1][act].hold)  # 根据👆定义，只有[买入]才消耗act
    end
  end

  dp[len - 1][k].no_hold
end

class State
  attr_accessor :hold, :no_hold
end

def max(*vals) = vals.max
