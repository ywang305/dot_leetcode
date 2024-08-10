# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer[]}
def next_greater_element(nums1, nums2)
  st = [] # monostack down
  next_big = {}
  (nums2.size - 1).downto(0).each do |i|
    n = nums2[i]
    st.pop while !st.empty? && st.last < n
    next_big[n] = st.last || -1
    st << n
  end

  nums1.map { |n| next_big[n] }
end
