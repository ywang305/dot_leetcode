# @param {Integer} k
# @param {Integer} n
# @return {Integer[][]}
def combination_sum3(k, n)
  ans = []
  temp = []
  dfs = lambda do |start, cnt, target|
    return if target < 0

    if cnt.zero?
      ans << temp.dup if target.zero?
      return
    end

    (start..9).each do |i|
      temp << i
      dfs.call(i+1, cnt-1, target-i)
      temp.pop
    end
  end

  dfs.call(1, k, n)
  ans
end
