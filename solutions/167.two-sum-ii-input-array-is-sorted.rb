# @param {Integer[]} numbers
# @param {Integer} target
# @return {Integer[]}
def two_sum(numbers, target)
  i = 0
  j = numbers.size - 1
  while i <= j
    sum = numbers[i] + numbers[j]
    if sum < target
      i += 1
    elsif sum > target
      j -= 1
    else
      return [i + 1, j + 1]
    end
  end
  -1
end

# 双指针，缩减搜索空间（虽然看起来像BS - O(logN)，但完全不同 - O(N) ）
