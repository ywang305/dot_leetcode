# @param {Character[][]} grid
# @return {Integer}
def num_islands(grid)
  m = grid.size
  n = grid[0].size
  visited = Set.new

  dfs = lambda do |x,y|
    return false if visited.include?([x,y]) || x<0 || y<0 || x==m || y==n || grid[x][y]=='0'

    visited << [x,y]
    dfs.call(x-1, y)
    dfs.call(x+1, y)
    dfs.call(x, y-1)
    dfs.call(x, y+1)
    true
  end

  cnt = 0
  (0...m).each do |x|
    (0...n).each do |y|
      cnt += 1 if dfs.call(x,y)
    end
  end
  cnt
end
