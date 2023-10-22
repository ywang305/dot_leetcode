# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def sort_colors(nums)
  p = 0
  (0...nums.length).each do |i|
    if nums[i] == 0
      swap(nums, i, p)
      p += 1
    end
  end
  (p...nums.length).each do |i|
    if nums[i] == 1
      swap(nums, i, p)
      p += 1
    end
  end
end

def swap(nums, i, j)
  nums[i], nums[j] = nums[j], nums[i]
end
