# @param {Integer[]} nums
# @return {Integer[][]}
def subsets_with_dup(nums)
  nums.sort!
  res = []
  cur = []
  dfs = lambda { |start|
    res << cur.dup
    (start...nums.length).each do |i|
      next if i > start && nums[i] == nums[i-1]
      cur.push nums[i]
      dfs.call(i+1)
      cur.pop
    end
  }
  dfs.call(0)
  res
end
