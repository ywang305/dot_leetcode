# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def subarray_sum(nums, k)
  presum = [0]
  nums.each { |n| presum << presum.last + n }
  ans = 0
  cnt = Hash.new { |h, k| h[k] = 0 }
  presum.each do |sum|
    pre_k = sum - k
    ans += cnt[pre_k] if cnt.key?(pre_k)
    cnt[sum] += 1
  end
  ans
end
