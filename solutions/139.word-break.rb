# @param {String} s
# @param {String[]} word_dict
# @return {Boolean}
def word_break(s, word_dict)
  dp = [true]
  (1..s.size).each do |j|
    j.downto(1) do |i|
      dp[j] = dp[i-1] && word_dict.include?(s[(i-1)...j])
      break if dp[j]
    end
  end
  dp.last
end
# @lc code=end
