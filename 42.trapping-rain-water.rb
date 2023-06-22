#
# @lc app=leetcode id=42 lang=ruby
#
# [42] Trapping Rain Water
#

# @lc code=start
# @param {Integer[]} height
# @return {Integer}
def trap(height)
  stack = []
  sum = 0
  (0..height.length - 1).each do |right|
    until stack.empty? || height[right] <= height[stack.last]
      cur = stack.pop
      break if stack.empty?
      left = stack.last
      sum += ([height[left], height[right]].min - height[cur]) * (right - left - 1)
    end
    stack << right
  end
  sum
end
# @lc code=end

trap([0,1,0,2,1,0,1,3,2,1,2,1])
