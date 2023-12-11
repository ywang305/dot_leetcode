# @param {Character[][]} board
# @return {Void} Do not return anything, modify board in-place instead.
def solve(board)
  m = board.size
  n = board.first.size

  dfs = lambda do |(x,y)|
    return if x<0 || y<0 || x>=m || y>=n
    return if board[x][y] == 'X' || board[x][y] == 'OO'

    board[x][y] = 'OO'

    [[x-1,y], [x+1,y], [x,y-1], [x,y+1]].each {|point| dfs.call(point)}
  end

  m.times do |i|
    dfs.call([i, 0])
    dfs.call([i, n-1])
  end
  n.times do |j|
    dfs.call([0, j])
    dfs.call([m-1, j])
  end

  m.times do |i|
    n.times do |j|
      board[i][j] = board[i][j] == 'OO' ? 'O' : 'X'
    end
  end
end
