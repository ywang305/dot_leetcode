# @param {Integer[][]} arrays
# @return {Integer}
def max_distance(arrays)
  ans = -1
  min_val, max_val = arrays[0][0], arrays[0][-1]
  (1...arrays.size).each do |i|
      arr = arrays[i]
      cur_min, cur_max = arr[0], arr[-1]
      ans = max(ans, (cur_max - min_val).abs, (max_val-cur_min).abs)
      min_val = min(cur_min, min_val)
      max_val = max(cur_max, max_val)
  end
  ans
end

def min(*vars)=vars.min
def max(*vars)=vars.max
