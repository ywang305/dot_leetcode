# @param {Integer[]} nums
# @param {Integer} x
# @return {Integer}
def max_score(nums, x)
  even_max = nums[0].even? ? nums[0] : nums[0] - x
  odd_max = nums[0].odd? ? nums[0] : nums[0] - x

  (1...nums.size).each do |i|
    cur = nums[i]
    if cur.even?
      even_max = max(even_max + cur, odd_max + cur - x)
    else
      odd_max = max(odd_max + cur, even_max + cur - x)
    end
  end
  max(even_max, odd_max)
end

def max(*nums) = nums.max
