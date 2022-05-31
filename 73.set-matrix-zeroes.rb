#
# @lc app=leetcode id=73 lang=ruby
#
# [73] Set Matrix Zeroes
#

# @lc code=start
# @param {Integer[][]} matrix
# @return {Void} Do not return anything, modify matrix in-place instead.
def set_zeroes(matrix)
  m = matrix.size
  n = matrix[0].size
  todo = lambda do |i, j|
    (0..m - 1).each { |x| matrix[x][j] = 0 }
    (0..n - 1).each { |y| matrix[i][y] = 0 }
  end
  todos = []
  (0..m - 1).each do |i|
    (0..n - 1).each do |j|
      next unless matrix[i][j] == 0

      todos << -> { todo.call(i, j) }
    end
  end
  todos.each(&:call)
end
# @lc code=end
