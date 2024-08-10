# @param {Integer[]} nums
# @return {Integer}
def jump(nums)
  cur = 0
  ne = 0
  step = 0
  nums.each.with_index do |n, i|
      break if cur >= nums.size-1
      ne = max(ne, n+i)
      if cur == i
          cur = ne
          step += 1
      end
  end
  step
end

def max(*a)=a.max
# @lc code=end
