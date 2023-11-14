# @param {Integer} n
# @return {Integer}
def num_trees(n)
  dp = [1, 1] # dp[i], 节点数量i对应的解
  (2..n).each do |cur|
    dp[cur] = 0
    (1..cur).each do |i| # 枚举root
      dp[cur] += dp[i-1] * dp[cur-i] # 左*右：贡献值
    end
  end
  dp.last
end

# 以 n=2 为例，
# 枚举 1 为 root， 则左边0个点对应dp[0] = 1, 右边一个点（2）对应 dp[1]=1 -> dp[0]*dp[1] -> 1
# 枚举 2 为 root， 则左边一个点（1）对应dp[0] = 1, 右边0个点对应 dp[0]=1 -> dp[1]*dp[0] -> 1
# dp[2] = dp[0]*dp[1] + dp[1]*dp[0] = 2
#
# 以 n=3 为例，
# 枚举 1 为 root， dp[0]*dp[2] -> 2
# 枚举 2 为 root， dp[1]*dp[1] -> 1
# 枚举 3 为 root， dp[2]*dp[0] -> 2
# dp[3] = dp[0]*dp[2] + dp[1]*dp[1] + dp[2]*dp[0] = 5
