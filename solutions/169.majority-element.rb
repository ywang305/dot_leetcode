#
# @lc app=leetcode id=169 lang=ruby
#
# [169] Majority Element
#

# @lc code=start
# @param {Integer[]} nums
# @return {Integer}
def majority_element(nums)
  count = 0
  for n in nums
    x = n if count.zero?
    count += x == n ? 1 : -1
  end
  x
end
# @lc code=end


# 摩尔投票算法
