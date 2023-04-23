#
# @lc app=leetcode id=6 lang=ruby
#
# [6] Zigzag Conversion
#

# @lc code=start
# @param {String} s
# @param {Integer} num_rows
# @return {String}
def convert(s, num_rows)
  pattern = [*0...num_rows] + (num_rows - 2).downto(1).to_a
  s.chars.each_with_index.each_with_object(Array.new(num_rows) { String.new }) do |(c, i), acc|
    acc[pattern[i % pattern.length]] << c
  end.join
end
# @lc code=end
