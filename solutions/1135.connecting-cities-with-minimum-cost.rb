# @param {Integer} n
# @param {Integer[][]} connections
# @return {Integer}
def minimum_cost(n, connections)
  ufo = UnionFind.new
  conn = connections.sort { _1[2] - _2[2] }
  total = 0
  edge = 0
  conn.each do |a, b, cost|
    if ufo.union(a, b)
      total += cost
      edge += 1
      return total if edge == n - 1
    end
    break if edge == n
  end
  -1
end

class UnionFind
  def initialize
    @roots = {}
  end

  def find(x)
    @roots[x] ||= x
    return x if @roots[x] == x

    find(@roots[x])
  end

  def union(x, y)
    root_x = find(x)
    root_y = find(y)
    if root_x != root_y
      @roots[root_y] = root_x
      return true
    end
    false
  end
end
