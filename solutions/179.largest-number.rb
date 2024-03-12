# @param {Integer[]} nums
# @return {String}
def largest_number(nums)
  res = nums.map(&:to_s).sort{
    if _1 + _2 == _2 + _1 then 0
    else _1 + _2 < _2 + _1 ? 1 : -1 end
   }.join
  res[0] == '0' ? '0' : res
end
