#
# @lc app=leetcode id=56 lang=ruby
#
# [56] Merge Intervals
#

# @lc code=start
# @param {Integer[][]} intervals
# @return {Integer[][]}
def merge(intervals)
  intervals.sort_by!(&:first) # list = intervals.sort { _1.first - _2.first }
  res = [intervals[0]]
  (1..intervals.length - 1).each do |i|
    s1, e1 = res.last
    s2, e2 = intervals[i]
    if e1 >= s2
      res.last[1] = [e1, e2].max
    else
      res << intervals[i]
    end
  end
  res
end
# @lc code=end
merge([[1, 4], [0, 4]])
