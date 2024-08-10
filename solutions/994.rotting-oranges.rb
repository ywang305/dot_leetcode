# @param {Integer[][]} grid
# @return {Integer}
def oranges_rotting(grid)
  m = grid.size
  n = grid[0].size

  q = []
  total_orange = 0
  (0...m).each do |i|
      (0...n).each do |j|
          if grid[i][j]==2
              q << [i,j]
          end
          if grid[i][j]>0
              total_orange+=1
          end
      end
  end
  step = 0
  rotten_num = q.size

  while q.size > 0
      q.shift(q.size).each do |x,y|
          [[x-1,y], [x+1,y], [x,y-1], [x,y+1]].each do |nx, ny|
              if nx>=0 && nx<m && ny>=0 && ny<n && grid[nx][ny]==1
                  q << [nx, ny]
                  grid[nx][ny]=2
                  rotten_num += 1
              end
          end
      end
      step +=1 if q.size>0
  end
  rotten_num == total_orange ? step : -1
end

def min(*a)=a.min
