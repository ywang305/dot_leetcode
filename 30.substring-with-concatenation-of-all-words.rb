#
# @lc app=leetcode id=30 lang=ruby
#
# [30] Substring with Concatenation of All Words
#

# @lc code=start
# @param {String} s
# @param {String[]} words
# @return {Integer[]}
def find_substring(s, words)
  words_len = words.length
  word_len = words.first.length
  m1 = words.tally # 词频map
  (0..s.length - word_len * words_len).filter_map do |i|
    m2 = Hash.new { 0 }
    tmp_result = words_len.times do |j|
      substr = s[i + j * word_len, word_len]
      break -1 unless m1.key? substr

      m2[substr] += 1
      break -1 unless m2[substr] <= m1[substr]
    end
    tmp_result == -1 ? nil : i
  end
end
# @lc code=end
