#
# @lc app=leetcode id=46 lang=ruby
#
# [46] Permutations
#

# @lc code=start
# @param {Integer[]} nums
# @return {Integer[][]}
def permute(nums)
  ans = []
  tmp = []
  visited = []
  dfs = lambda do
    return ans << tmp.dup if tmp.length == nums.length

    (0...nums.length).each do |i|
      next if visited[i]
      visited[i] = true
      tmp << nums[i]
      dfs.call
      tmp.pop
      visited[i] = false
    end
  end

  dfs.call
  ans
end
# @lc code=end

