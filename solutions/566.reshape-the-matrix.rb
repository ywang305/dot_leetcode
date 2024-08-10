# @param {Integer[][]} mat
# @param {Integer} r
# @param {Integer} c
# @return {Integer[][]}
def matrix_reshape(mat, r, c)
  m = mat.size
  n = mat[0].size
  return mat if m == r && n == c
  return mat if m * n != r * c

  ans = Array.new(r) { Array.new(c) }
  (0...r * c).each do |x|
    ans[x / c][x % c] = mat[x / n][x % n]
  end
  ans
end
