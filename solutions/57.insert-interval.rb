# @param {Integer[][]} intervals
# @param {Integer[]} new_interval
# @return {Integer[][]}
def insert(intervals, new_interval)
  l, r = new_interval
  ans = []
  inserted = false
  (0...intervals.size).each do |i|
      s, e = intervals[i]
      if r < s
          ans << [l, r]
          ans += intervals[i..]
          inserted = true
          break
      elsif e < l
          ans << [s, e]
      else
          l = min(l, s)
          r = max(r, e)
      end
  end
  ans << [l, r] unless inserted
  ans
end

def max(*v)=v.max
def min(*v)=v.min
