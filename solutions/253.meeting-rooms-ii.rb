# @param {Integer[][]} intervals
# @return {Integer}
def min_meeting_rooms(intervals)
  list = intervals.flat_map{|s,e| [[s, 1], [e, -1]]}.sort{|a,b| a[0]==b[0] ? a[1]-b[1]: a[0]-b[0]}
  ans = 0
  cur = 0
  list.each do |s, dir|
      cur += dir
      ans = max(ans, cur)
  end
  ans
end
def max(*vars) = vars.max
