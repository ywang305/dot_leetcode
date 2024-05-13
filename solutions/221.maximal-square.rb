# @param {Character[][]} matrix
# @return {Integer}
def maximal_square(matrix)
  ans = 0
  m = matrix.size
  n = matrix.first.size

  (0...m).each do |x|
    (0...n).each do |y|
      if x > 0 && y > 0 && matrix[x][y].to_i == 1
        matrix[x][y] = 1 + min(matrix[x - 1][y], matrix[x][y - 1], matrix[x - 1][y - 1])
      end
      ans = max(ans, matrix[x][y])
    end
  end
  ans**2
end

def max(*args) = args.map(&:to_i).max
def min(*args) = args.map(&:to_i).min
