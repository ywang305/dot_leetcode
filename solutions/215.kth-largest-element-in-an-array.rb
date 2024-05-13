# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def find_kth_largest(nums, k)
  quick_select(nums, 0, nums.size-1, k-1)
end

def quick_select(nums, s, e, k)
  p = s
  pivot = nums[e]
  (s..e).each do |j|
    if nums[j] >= pivot
      swap(nums, p, j)
      p += 1
    end
  end
  return quick_select(nums, p, e, k) if p-1 < k
  return quick_select(nums, s, p-2, k) if p-1 > k
  nums[p-1]
end

def swap(nums, i, j)
  nums[i], nums[j] = nums[j], nums[i]
end
