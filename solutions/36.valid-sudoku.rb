#
# @lc app=leetcode id=36 lang=ruby
#
# [36] Valid Sudoku
#

# @lc code=start
# @param {Character[][]} board
# @return {Boolean}
def is_valid_sudoku(board)
  def isValid(arr)
    arr = arr.filter { |x| x != '.' }
    arr.uniq.size == arr.size
  end

  (0..8).each do |i|
    return false unless isValid(board[i])
  end
  (0..8).each do |j|
    return false unless isValid(board.map { |r| r[j] })
  end
  (0..2).each do |i|
    (0..2).each do |j|
      return false unless isValid(board[i * 3, 3].flat_map { |r| r[j * 3, 3] })
    end
  end
  true
end
# @lc code=end
