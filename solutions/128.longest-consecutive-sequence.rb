# @param {Integer[]} nums
# @return {Integer}
def longest_consecutive(nums)
  res = 0
  set = nums.to_set
  set.each do |n|
    unless set.include?(n-1) # 什么样的数才是一个连续序列的起点？答案是这个数的前一个数不存在于数组中
      seq_len = 0
      seq_len += 1 while set.include?(n+seq_len) # 什么时候是终点呢？答案是当前数num的后一个数nunm + 1不存在于数组中
      res = [res, seq_len].max
    end
  end
  res
end
