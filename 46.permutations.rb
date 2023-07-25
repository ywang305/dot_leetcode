#
# @lc app=leetcode id=46 lang=ruby
#
# [46] Permutations
#

# @lc code=start
# @param {Integer[]} nums
# @return {Integer[][]}
def permute(nums)
  swap = ->(i, j) { nums[i], nums[j] = nums[j], nums[i] }
  ans = []
  tmp = []
  dfs = ->(start) do
    return ans << tmp.dup if start == nums.length

    (start...nums.length).each do |i|
      swap.call(start, i)
      tmp << nums[start]
      dfs.call(start + 1)
      tmp.pop
      swap.call(start, i)
    end
  end

  dfs.call(0)
  ans
end
# @lc code=end

