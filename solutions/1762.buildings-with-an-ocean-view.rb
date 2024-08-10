# @param {Integer[]} heights
# @return {Integer[]}
def find_buildings(heights)
  n = heights.size
  ans = []
  stack = []
  (n - 1).downto(0) do |i|
    cur = heights[i]
    stack.pop while !stack.empty? && cur > stack.last
    ans.unshift(i) if stack.empty?
    stack.push cur
  end
  ans
end
