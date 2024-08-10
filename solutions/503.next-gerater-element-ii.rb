# @param {Integer[]} nums
# @return {Integer[]}
def next_greater_elements(nums)
  st = []
  n = nums.size
  ans = []
  (nums.size * 2 - 1).downto(0).each do |i|
    num = nums[i % n]
    st.pop while !st.empty? && num >= st.last
    ans[i % n] = st.last || -1
    st << num
  end
  ans
end
