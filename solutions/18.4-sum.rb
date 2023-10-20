#
# @lc app=leetcode id=18 lang=ruby
#
# [18] 4Sum
#

# @lc code=start
# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[][]}
def four_sum(nums, target)
  nums.sort!
  res = []
  (0..nums.size - 4).each do |i|
    (i + 1..nums.size - 3).each do |j|
      left = j + 1
      right = nums.size - 1
      while left < right
        a = nums[i]
        b = nums[j]
        c = nums[left]
        d = nums[right]
        sum = a + b + c + d
        if sum < target
          left += 1
        elsif sum > target
          right -= 1
        else
          res << [a, b, c, d] unless res.include?([a, b, c, d])
          left += 1
        end
      end
    end
  end
  res
end
# @lc code=end
four_sum([1, 0, -1, 0, -2, 2], 0)
