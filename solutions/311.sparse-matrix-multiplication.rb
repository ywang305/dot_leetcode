# @param {Integer[][]} mat1
# @param {Integer[][]} mat2
# @return {Integer[][]}
def multiply(mat1, mat2)
  m, n, n_2 = mat1.length, mat1.first.length, mat2.first.length
  mat2_trans = mat2.transpose

  mult = lambda do |row, col|
      row.zip(col).reduce(0) do |acc, (item1, item2)|
          acc += item1 * item2 unless item1.zero? || item2.zero?
          acc
      end
  end

  ans = Array.new(m) { [ ] }

  (0..m-1).each do |r|
      (0..n_2-1).each do |c|
          ans[r][c] = mult.call mat1[r], mat2_trans[c]
      end
  end

  ans
end