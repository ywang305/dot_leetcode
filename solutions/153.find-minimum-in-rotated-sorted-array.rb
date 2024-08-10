# @param {Integer[]} nums
# @return {Integer}
def find_min(nums)
  i = 0
  j = nums.size - 1
  found = -1
  while i <= j #  实际上是不会跳出循环，当 left==right 时直接返回
    if nums[i] <= nums[j] # target 变种
      found = nums[i]
      break
    end

    m = i + (j - i) / 2
    if nums[i] <= nums[m]
      i = m + 1
    else
      j = m # 注意 right 更新时会被设为 mid 而不是 mid-1，因为 mid 无法被排除。
    end
  end
  found
end
