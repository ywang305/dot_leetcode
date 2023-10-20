#
# @lc app=leetcode id=11 lang=ruby
#
# [11] Container With Most Water
#

# @lc code=start
# @param {Integer[]} height
# @return {Integer}
def max_area(height)
  max_area = 0
  left = 0
  right = height.size - 1
  while left < right
    max_area = [max_area, (right - left) * [height[left], height[right]].min].max
    height[left] < height[right] ? left += 1 : right -= 1
  end
  max_area
end
# @lc code=end
