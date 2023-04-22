# @param {Integer[][]} intervals
# @return {Integer}
def min_meeting_rooms(intervals)
  sorted = intervals.flat_map { |(s, e)| [[s, 'start'], [e, 'end']] }.sort do |a, b|
    a[0] == b[0] ? a[1] <=> b[1] : a[0] <=> b[0] # in case same time with diff types like [1,13],[13, 20], ensure [13,'end'] prior to [13, 'end']
  end
  stack = Stack.new
  res = 0
  for (time, type) in sorted
    if type == 'start'
      stack.push time
    else
      stack.pop
    end
    res = stack.size if stack.size > res
  end
  res
end
