# @param {Character[][]} matrix
# @return {Integer}
def maximal_rectangle(matrix)
  largest_rectangle_in_histogram = ->(heights) do
    stack = []
    largest = 0
    heights.unshift(0).push(0)
    heights.each.with_index do |h, i|
      while i.positive? && h < heights[stack.last]
        emu_height = heights[stack.pop]
        left = stack.last + 1
        right = i - 1
        largest = [largest, emu_height*(right-left+1)].max
      end
      stack << i
    end
    largest
  end

  max = 0
  heights = Array.new(matrix.first.length) { 0 }
  matrix.each do |row|
    row.each.with_index do |e, i|
      if e == '0'
        heights[i] = 0
      else
        heights[i] += 1
      end
    end
    max = [max, largest_rectangle_in_histogram.call(heights.dup)].max
  end
  max
end


maximal_rectangle([["1","0"],["1","0"]])
