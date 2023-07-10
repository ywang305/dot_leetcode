#
# @lc app=leetcode id=45 lang=ruby
#
# [45] Jump Game II
#

# @lc code=start
# @param {Integer[]} nums
# @return {Integer}
def jump(nums)
    left = 0
    right = 0
    cnt = 0
    while right < nums.length - 1
      cnt += 1
      farthest = 0
      for i in left..right
        farthest = [farthest, i + nums[i]].max
      end
      left = right + 1
      right = farthest
    end
    cnt
end
# @lc code=end

