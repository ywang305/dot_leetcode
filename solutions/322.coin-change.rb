# @param {Integer[]} coins
# @param {Integer} amount
# @return {Integer}
#
# 方法1 - DFS + Memo
def coin_change(coins, amount)
  inf = (1 << 30)

  memo = {}

  dfs = lambda do |target_amt|
    return 0 if target_amt == 0
    return inf if target_amt < 0
    return memo[target_amt] if memo.key?(target_amt)

    ans = inf
    coins.each do |coin_value|
      sub_ans = dfs.call(target_amt - coin_value)
      ans = min(ans, sub_ans)
    end
    memo[target_amt] = ans + 1
  end

  ans = dfs.call(amount)
  ans >= inf ? -1 : ans
end

def coin_change_dp(coins, amount)
  dp = [inf] * (amount + 1)
  dp[0] = 0
  (1..amount).each do |cur_amt|
    coins.each do |coin|
      next if cur_amt - coin < 0

      dp[cur_amt] = min(dp[cur_amt], 1 + dp[cur_amt - coin])
    end
  end
  dp.last >= inf ? -1 : dp.last
end

def min(*vars)=vars.min
