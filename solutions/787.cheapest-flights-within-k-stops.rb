# @param {Integer} n
# @param {Integer[][]} flights
# @param {Integer} src
# @param {Integer} dst
# @param {Integer} k
# @return {Integer}

# DFS + memo
def find_cheapest_price(_n, flights, src, dst, k)
  inf = (1 << 31) - 1
  visited = Set.new << src
  memo = {}
  dfs = lambda do |s, step|
    return inf if step > k + 1
    return 0 if s == dst
    return memo[[s, step]] if memo.key?([s, step])

    ans = inf
    flights.each do |a, b, c|
      next unless a == s && visited.none?(b)

      visited << b
      sub_ans = dfs.call(b, step + 1)
      ans = min(ans, c + sub_ans)
      visited.delete(b)
    end
    memo[[s, step]] = ans
  end

  ans = dfs.call(src, 0)
  ans == inf ? -1 : ans
end

def min(*vars)=vars.min
