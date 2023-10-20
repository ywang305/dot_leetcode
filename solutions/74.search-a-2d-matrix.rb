# @param {Integer[][]} matrix
# @param {Integer} target
# @return {Boolean}
def search_matrix(matrix, target)
  def search_higher(list, target)
    i = 0
    j = list.length - 1
    while i <= j
      m = i + (j - i) / 2
      if list[m] <= target
        i = m + 1
      else
        j = m - 1
        found = m
      end
    end
    found
  end

  def search(list, target)
    i = 0
    j = list.length - 1
    while i <= j
      m = i + (j-i)/2
      i = m+1 if list[m] < target
      j = m-1 if list[m] > target
      return m if list[m] == target
    end
  end

  row_higher_index = search_higher( matrix.map { _1[0] }, target) || matrix.length
  return false if (row_higher_index - 1).negative?

  search(matrix[row_higher_index-1], target).nil? ? false : true
end
