# @param {Integer} m
# @param {Integer} n
# @param {Integer[][]} positions
# @return {Integer[]}
def num_islands2(_m, _n, positions)
  ufo = UnionFind.new
  visited = Set.new
  ans = []
  positions.each do |i, j|
    ufo.find([i, j]) # add cur to root
    ufo.union([i, j], [i - 1, j]) if visited.include?([i - 1, j])
    ufo.union([i, j], [i + 1, j]) if visited.include?([i + 1, j])
    ufo.union([i, j], [i, j - 1]) if visited.include?([i, j - 1])
    ufo.union([i, j], [i, j + 1]) if visited.include?([i, j + 1])
    visited << [i, j]
    ans << ufo.root.filter { |k, v| k == v }.size # top root is self pointed
  end
  ans
end

class UnionFind
  attr_reader :root

  def initialize = @root = {}

  def union(x, y)
    root_x = find(x)
    root_y = find(y)
    @root[root_y] = root_x unless root_x == root_y
  end

  def find(x)
    return x if (@root[x] ||= x) == x

    find(@root[x])
  end
end
