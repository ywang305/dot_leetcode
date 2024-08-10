# @param {Integer[][]} grid
# @return {Integer}
def minimum_moves(grid)
  n = grid.size

  from = []
  to = []
  (0...n).each do |i|
    (0...n).each do |j|
      num = grid[i][j]
      while num > 1
        from << [i, j]
        num -= 1
      end
      to << [i, j] if num == 0
    end
  end

  ans = (1 << 31) - 1
  from.permutation do |frm|
    cur_ans = frm.zip(to).reduce(0) do |a, c|
      f, t = c
      a + dist(f, t)
    end
    ans = min(ans, cur_ans)
  end
  ans
end

def dist(p1, p2)
  (p1[0] - p2[0]).abs + (p1[1] - p2[1]).abs
end

def min(*vv) = vv.min
