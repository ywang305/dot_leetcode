#
# @lc app=leetcode id=402 lang=ruby
#
# [402] Remove K Digits
#

# @lc code=start
# @param {String} num
# @param {Integer} k
# @return {String}
def remove_kdigits(num, k)
  stack = []
  remain = num.length-k
  num.chars.map(&:to_i).each do |n|
      while k.positive? && !stack.empty? && stack[-1]>n
          stack.pop
          k -= 1
      end
      stack.push n
  end
  res = stack[0...remain].join.sub(/^0+/, '') # 没remain，[9],k=1 会得到[9]， 而非[0]
  res.empty? ? "0" : res
end
# @lc code=end

