
# @param {Integer[]} nums
# @return {Integer[][]}
def subsets(nums)
  ans = []
  temp = []
  dfs = lambda do |start|
    ans << temp.dup

    (start...nums.length).each do |i|
      temp.push nums[i]
      dfs.call i+1
      temp.pop
    end
  end

  dfs.call 0
  ans
end
