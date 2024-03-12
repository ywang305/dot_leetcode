# @param {Integer[]} nums
# @return {Integer}
def rob(nums)
  norob, rob = nums.reduce([0, 0]) { |a,c|
    pre_norob, pre_rob = a
    a[0] = max(pre_rob + c, pre_norob)
    a[1] = pre_norob
    a
  }
  max(norob, rob)
end

def max(*vals) = vals.max
