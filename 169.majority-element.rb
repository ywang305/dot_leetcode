#
# @lc app=leetcode id=169 lang=ruby
#
# [169] Majority Element
#

# @lc code=start
# @param {Integer[]} nums
# @return {Integer}
def majority_element(nums)
  # Moorer's Vote
  nums.reduce({vote: 0, candidate: nil}) do |memo, num|
    if memo[:vote].zero?
      memo[:vote] += 1
      memo[:candidate] = num
    else
      memo[:vote] = memo[:candidate]==num ? 1 : -1
    end
    memo
  end[:candidate]
end
# @lc code=end

