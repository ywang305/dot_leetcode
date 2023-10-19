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
  memo = {}
  nums.each_with_index do |v, i|
    return [memo[target - v], i] if memo.key?(target - v)

    memo[v] = i
  end
end
# @lc code=end

two_sum([2, 7, 11, 15], 9)
