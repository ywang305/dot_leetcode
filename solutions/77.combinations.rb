# @param {Integer} n
# @param {Integer} k
# @return {Integer[][]}
def combine(n, k)
  list = [*1..n]

  ans = []
  temp = []
  dfs = lambda do |start|
    if temp.length == k
      ans << temp.dup
      return
    end

    return if list.length == start

    (start...list.length).each do |i|
      temp << list[i]
      dfs.call i+1
      temp.pop
    end
  end

  dfs.call 0
  ans
end
