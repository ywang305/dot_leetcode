# @param {Integer[]} temperatures
# @return {Integer[]}
def daily_temperatures(temperatures)
  n = temperatures.size
  st = []
  ans = []
  (n - 1).downto(0).each do |i|
    t = temperatures[i]
    st.pop while !st.empty? && temperatures[st.last] <= t
    ans[i] = st.empty? ? 0 : st.last - i
    st << i
  end
  ans
end
