#
# @lc app=leetcode id=15 lang=ruby
#
# [15] 3Sum
#

# @lc code=start
# @param {Integer[]} nums
# @return {Integer[][]}
def three_sum(nums)
  nums.sort!
  ans = Set.new
  (0..nums.length - 3).each do |i|
    j = i + 1
    k = nums.length - 1
    while j < k
      sum = nums[i] + nums[j] + nums[k]
      if sum < 0
        j += 1
      elsif sum > 0
        k -= 1
      else
        ans << [nums[i], nums[j], nums[k]]
        j += 1
        k -= 1
      end
    end
  end
  [*ans]
end
# @lc code=end

three_sum([-1, 0, 1, 2, -1, -4])

# @param {Integer[]} nums
# @return {Integer[][]}
def three_sum(nums)
  ans = Set.new
  nums.sort!
  i = 0
  while i < nums.size - 2
    j = i + 1
    k = nums.size - 1
    while j < k
      sum = nums[i] + nums[j] + nums[k]
      if sum < 0
        j += 1
        j += 1 while j < k && nums[j - 1] == nums[j] # 优化 跳过相同
      elsif sum > 0
        k -= 1
        k -= 1 while j < k && nums[k + 1] == nums[k] # 优化 跳过相同
      else
        ans << [nums[i], nums[j], nums[k]]
        j += 1
        k -= 1
        j += 1 while j < k && nums[j - 1] == nums[j] # 优化 跳过相同
        k -= 1 while j < k && nums[k + 1] == nums[k] # 优化 跳过相同
      end
    end
    i += 1
  end
  ans.to_a
end
