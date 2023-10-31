# @param {Character[][]} board
# @param {String} word
# @return {Boolean}
def exist(board, word)
  m = board.length
  n = board[0].length
  visited = Set.new
  word_index = 0

  dfs = lambda do |x, y|
    return true if word_index == word.length
    return false if x<0 || y<0 || x==m || y==n || visited.include?([x,y]) || board[x][y] != word[word_index]

    visited << [x,y]
    word_index += 1
    return true if [[x-1,y], [x+1,y], [x,y-1], [x,y+1]].map{|next_xy| dfs.call *next_xy }.any?
    visited.delete [x,y]
    word_index -= 1
    false
  end

  (0...m).each do |x|
    (0...n).each do |y|
      return true if dfs.call x,y
    end
  end

  return false
end
