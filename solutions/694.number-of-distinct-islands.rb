# @param {Integer[][]} grid
# @return {Integer}
def num_distinct_islands(grid)
  m = grid.size
  n = grid[0].size
  island_set = Set.new
  dfs = lambda do |x, y|
    return [] if [x < 0, y < 0, x == m, y == n].any? || grid[x][y] == 0

    grid[x][y] = 0
    down = dfs.call(x - 1, y)
    up = dfs.call(x + 1, y)
    left = dfs.call(x, y - 1)
    right = dfs.call(x, y + 1)
    [[x, y]] + down + up + left + right
  end

  (0...m).each do |i|
    (0...n).each do |j|
      next if (island = dfs.call(i, j)).empty?

      island_set << island.map { |x, y| [x - i, y - j] }
    end
  end

  island_set.size
end
