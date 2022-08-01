#
# @lc app=leetcode id=228 lang=ruby
#
# [228] Summary Ranges
#

# @lc code=start
# @param {Integer[]} nums
# @return {String[]}
def summary_ranges(nums)
  res = []
  temp = []
  nums.each do |num|
    if !temp.last.nil? && temp.last != num - 1
      res << (temp.size == 1 ? temp.first.to_s : "#{temp.first}->#{temp.last}")
      temp = []
    end
    temp << num
  end
  res << (temp.size == 1 ? temp.first.to_s : "#{temp.first}->#{temp.last}") unless temp.empty?
  res
end
# @lc code=end
