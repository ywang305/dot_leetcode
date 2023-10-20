#
# @lc app=leetcode id=40 lang=ruby
#
# [40] Combination Sum II
#

# @lc code=start
# @param {Integer[]} candidates
# @param {Integer} target
# @return {Integer[][]}
def combination_sum2(candidates, target)
  candidates.sort!
  ans = []
  tmp = []
  dfs = ->(start) do
    sum = tmp.sum
    if sum >= target
      ans << tmp.dup if sum == target
      return
    end

    (start...candidates.size).each do |i|
       next if i > start && candidates[i] == candidates[i-1]
       tmp << candidates[i]
       dfs.call(i+1)
       tmp.pop
    end
  end
  dfs.call(0)
  ans
end
# @lc code=end

