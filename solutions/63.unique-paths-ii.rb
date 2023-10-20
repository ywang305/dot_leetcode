#
# @lc app=leetcode id=63 lang=ruby
#
# [63] Unique Paths II
#

# @lc code=start
# @param {Integer[][]} obstacle_grid
# @return {Integer}
def unique_paths_with_obstacles(obstacle_grid)
  memo = {}

  dfs = lambda do |x,y|
    return 0 if x < 0 || y < 0 || obstacle_grid[x][y] == 1
    return 1 if x == 0 && y == 0

    memo[[x,y]] ||= dfs.call(x-1, y) + dfs.call(x, y-1)
  end

  dfs.call(obstacle_grid.length-1, obstacle_grid.first.length-1)
end
# @lc code=end

