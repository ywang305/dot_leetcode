#
# @lc app=leetcode id=47 lang=ruby
#
# [47] Permutations II
#

# @lc code=start
# @param {Integer[]} nums
# @return {Integer[][]}
def permute_unique(nums)
  nums.sort!
  ans = []
  tmp = []
  visited = []
  dfs = lambda do
    return ans << tmp.dup if tmp.length == nums.length

    (0...nums.length).each do |i|
      next if visited[i] || (i > 0 && nums[i] == nums[i-1] && visited[i-1])

      visited[i] = true
      tmp << nums[i]
      dfs.call()
      tmp.pop
      visited[i] = false
    end
  end

  dfs.call()
  ans
end
# @lc code=end
