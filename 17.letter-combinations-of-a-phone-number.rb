#
# @lc app=leetcode id=17 lang=ruby
#
# [17] Letter Combinations of a Phone Number
#

# @lc code=start
# @param {String} digits
# @return {String[]}
def letter_combinations(digits)
  words = [
    '',
    '',
    'abc',
    'def',
    'ghi',
    'jkl',
    'mno',
    'pqrs',
    'tuv',
    'wxyz'
  ]
  combine = lambda do |index|
    return [] if index == digits.length

    d = digits[index]
    ans = []
    sub_ans = combine.call(index + 1)
    words[d.to_i].each_char do |c|
      ans << c if sub_ans.empty?
      sub_ans.each do |sub_word|
        ans << c + sub_word
      end
    end
    ans
  end

  combine.call(0)
end
# @lc code=end
