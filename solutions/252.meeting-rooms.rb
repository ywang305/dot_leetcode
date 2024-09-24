# @param {Integer[][]} intervals
# @return {Boolean}
def can_attend_meetings(intervals)
  inouts = []
  intervals.each do |s, e|
    inouts[s] ||= 0
    inouts[e] ||= 0
    inouts[s] += 1
    inouts[e] -= 1
  end
  max_cnt = 0
  inouts.compact.each do |val|
    max_cnt += val
    return false if max_cnt > 1
  end
  true
end
