# @param {Integer[]} cost
# @return {Integer}
def min_cost_climbing_stairs(cost)
  dp = [0, 0]
  (2...cost.size).each do |i|
    dp[i] = min(dp[i - 1] + cost[i - 1], dp[i - 2] + cost[i - 2])
  end
  min(dp[-2] + cost[-2], dp[-1] + cost[-1])
end

def min(*v) = v.min
