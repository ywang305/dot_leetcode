#
# @lc app=leetcode id=283 lang=ruby
#
# [283] Move Zeroes
#

# @lc code=start
# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def move_zeroes(nums)
  index = 0
  nums.each do |num|
    unless num.zero?
      nums[index] = num
      index += 1
    end
  end

  (index..nums.length - 1).each { |i| nums[i] = 0 }
end
# @lc code=end
