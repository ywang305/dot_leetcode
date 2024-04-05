# @param {Integer} target
# @param {Integer[]} nums
# @return {Integer}
def min_sub_array_len(target, nums)
  i=0
  sum = 0
  ans = nums.size+1
  (0...nums.size).each do |j|
    sum += nums[j]
    while sum >= target
      ans = [ans, j-i+1].min
      sum -= nums[i]
      i += 1
    end
  end
  ans == nums.size+1 ? 0 : ans
end
