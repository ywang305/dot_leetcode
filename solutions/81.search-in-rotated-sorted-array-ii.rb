# @param {Integer[]} nums
# @param {Integer} target
# @return {Boolean}
def search(nums, target)
  i = 0
  j = nums.length - 1
  while i <= j
    m = i + (j - i) / 2
    return true if nums[m] == target

    if nums[i] < nums[m] # left section in order
      if nums[i] <= target && target < nums[m]
        j = m - 1
      else
        i = m + 1
      end
    elsif nums[i] > nums[m] # right section in order
      if nums[m] < target && target <= nums[j]
        i = m + 1
      else
        j = m - 1
      end
    else # nums[i] == nums[m], skip i
      i += 1
    end
  end
  false
end
