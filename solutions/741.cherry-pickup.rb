#
# @lc app=leetcode id=741 lang=ruby
#
# [741] Cherry Pickup
#

# @lc code=start
# @param {Integer[][]} grid
# @return {Integer}
def cherry_pickup(grid)
  n = grid.size
  dp = Array.new(n*2-1) { Array.new(n) { Array.new(n, -Float::INFINITY) } } # n*2-1 steps, n rows, n cols, track max cherries
  dp[0][0][0] = grid[0][0]
  (1...2*n-1).each do |k| # k is step
    (0..[n-1, k].min).each do |x1|
      (x1..[n-1, k].min).each do |x2|
        y1 = k - x1
        y2 = k - x2
        v1 = grid[x1][y1]
        v2 = grid[x2][y2]
        next if v1.nil? || v2.nil? || v1 == -1 || v2 == -1
        res = dp[k-1][x1][x2] # 都往右
        res = [res, dp[k-1][x1-1][x2]].max if x1 > 0 # 往下，往右
        res = [res, dp[k-1][x1][x2-1]].max if x2 > 0 # 往右，往下
        res = [res, dp[k-1][x1-1][x2-1]].max if x1 > 0 && x2 > 0 # 都往下

        res += v1 + (x1==x2 ? 0 : v2) # 加上当前， 如果重复只加一次
        dp[k][x1][x2] = res
      end
    end
  end
  [dp[n*2-2][n-1][n-1], 0].max
end
# @lc code=end

puts cherry_pickup([[0,1,-1],[1,0,-1],[1,1,1]])

