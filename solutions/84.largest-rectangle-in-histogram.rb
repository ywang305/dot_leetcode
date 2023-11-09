# @param {Integer[]} heights
# @return {Integer}
def largest_rectangle_area(heights)
  max = 0
  heights.unshift(0).push(0)
  stack = [] # monotonic up

  heights.each.with_index do |h, i|
    while i.positive? && h < heights[stack.last]
      summit_index = stack.pop
      left = stack.last + 1
      right = i - 1
      max = [max, heights[summit_index] * (right - left + 1)].max
    end
    stack << i
  end
  max
end
