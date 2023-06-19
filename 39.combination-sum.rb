#
# @lc app=leetcode id=39 lang=ruby
#
# [39] Combination Sum
#

# @lc code=start
# @param {Integer[]} candidates
# @param {Integer} target
# @return {Integer[][]}
def combination_sum(candidates, target)
  candidates.sort!
  ans = []
  temp = []
  dfs = lambda do |start|
    sum = temp.sum
    if sum >= target
      ans << temp.dup if sum == target
      return
    end

    (start...candidates.length).each do |i|
      temp << candidates[i]
      dfs.call(i)
      temp.pop
    end
  end

  dfs.call(0)

  ans
end
# @lc code=end
