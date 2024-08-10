# @param {Integer} amount
# @param {Integer[]} coins
# @return {Integer}
def change(amount, coins)
  dp = [0] * (amount + 1)
  dp[0] = 1 # 动态规划的边界是 dp[0]=1。只有当不选取任何硬币时，金额之和才为 0，因此只有 1 种硬币组合。
  coins.each do |coin|
    (coin..amount).each do |amt|
      dp[amt] += dp[amt - coin]
    end
  end
  dp.last
end

#   对于面额为 coin 的硬币，当 coin≤i≤amount 时，如果存在一种硬币组合的金额之和等于 i−coin，
#   则在该硬币组合中增加一个面额为 coin 的硬币，即可得到一种金额之和等于 i 的硬币组合。
#
#        0  1  2  3  4  5(背包容量)
#     1  0  0  0  0  0 没有硬币的时候）
#     =======================
#         0  1  2  3  4  5(背包容量)
#     1   1  1  1  1  1  1
#     =======================
#         0  1  2  3  4  5(背包容量)
#     1   1  1  1  1  1  1
#     2         2  2  3  3
#     有了面值为2的硬币后，哎，我就是不用，所以方案数还是dp[j]种；
#     但是我如果用了，那我看看在放入这枚硬币前，也就是背包容量为[j-coins[i]]的时候有几种方案;
#     两种情况加起来，所以就是  dp[j] = dp[j]+dp[j-coins[i]];
#     ========================
#         0  1  2  3  4  5(背包容量)
#     1   1  1  1  1  1  1
#     2         2  2  3  3
#     5                  4
#
