#
# @lc app=leetcode id=64 lang=ruby
#
# [64] Minimum Path Sum
#

# @lc code=start
# @param {Integer[][]} grid
# @return {Integer}
def min_path_sum(grid)
  map = {}

  dfs = lambda do |x, y|
      return map[[x,y]] if map.key? [x,y]
      return grid[0][0] if x==0 && y==0
      return grid[x][y] + dfs.call(x, y-1) if x==0
      return grid[x][y] + dfs.call(x-1, y) if y==0
      map[[x,y]] ||= grid[x][y] + [dfs.call(x, y-1), dfs.call(x-1, y)].min
  end

  m = grid.length
  n = grid[0].length
  dfs.call(m-1, n-1)
end
# @lc code=end

