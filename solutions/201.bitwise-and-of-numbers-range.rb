# @param {Integer} left
# @param {Integer} right
# @return {Integer}
def range_bitwise_and(left, right)
  right &= right-1 until right <= left
  right
end
