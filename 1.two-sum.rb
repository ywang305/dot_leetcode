#
# @lc app=leetcode id=1 lang=ruby
#
# [1] Two Sum
#

# @lc code=start
# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
  hash = {}
  nums.each_with_index do |num, i|
    return [hash[target - num], i] if hash[target - num]

    hash[num] = i
  end
end
# @lc code=end
