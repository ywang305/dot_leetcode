

# 方法1 从空位搜索房子
# @param {Integer[][]} grid
# @return {Integer}
def shortest_distance(grid)
  max_value = (1 << 31) - 1
  m = grid.length
  n = grid.first.length

  is_good = lambda do |(x, y), visited|
    good = !visited.include?([x, y]) && x >= 0 && y >= 0 && x < m && y < n && grid[x][y] != 2
    visited.add([x, y]) if good
    good
  end

  building_count = grid.reduce(0) do |acc, cur|
    acc + cur.count(1)
  end

  bfs_from_empty = lambda do |x, y|
    visited = Set.new
    dist = 0
    level = 0
    is_good.call([x, y], visited)
    que = [] << [x, y]

    house_count = 0

    puts que

    until que.empty?
      que.length.times do |_i|
        x, y = que.shift
        if grid[x][y] == 1
          dist += level
          house_count += 1
        end
        que << [x - 1, y] if is_good.call([x - 1, y], visited)
        que << [x + 1, y] if is_good.call([x + 1, y], visited)
        que << [x, y - 1] if is_good.call([x, y - 1], visited)
        que << [x, y + 1] if is_good.call([x, y + 1], visited)
      end
      level += 1
    end

    house_count == building_count ? dist : max_value
  end

  min_dist = max_value
  (0..m - 1).each do |row|
    (0..n - 1).each do |col|
      min_dist = [min_dist, bfs_from_empty.call(row, col)].min if grid[row][col] == 0
    end
  end
  min_dist == max_value ? -1 : min_dist
end

# 方法2 从房子开始搜索空位
# @param {Integer[][]} grid
# @return {Integer}
def shortest_distance(grid)
  m = grid.length
  n = grid.first.length

  is_good = lambda do |(x, y), visited|
    good = !visited.include?([x, y]) && x >= 0 && y >= 0 && x < m && y < n && grid[x][y] == 0
    visited.add([x, y]) if good
    good
  end

  target_house_count = grid.reduce(0) do |acc, cur_row|
    acc + cur_row.count(1)
  end

  dist = Array.new(m) { Array.new(n) { 0 } }
  found = Array.new(m) { Array.new(n) { 0 } } # track found house count from empty point

  max_value = (1 << 31) - 1
  min_dist = max_value

  bfs_from_house = lambda do |row, col|
    visited = Set.new
    level = 0
    que = [] << [row, col]
    visited.add [row, col]

    until que.empty?
      que.length.times do |_i|
        x, y = que.shift
        if grid[x][y] == 0
          dist[x][y] += level
          found[x][y] += 1
        end
        min_dist = [min_dist, dist[x][y]].min if found[x][y] == target_house_count

        que << [x - 1, y] if is_good.call([x - 1, y], visited)
        que << [x + 1, y] if is_good.call([x + 1, y], visited)
        que << [x, y - 1] if is_good.call([x, y - 1], visited)
        que << [x, y + 1] if is_good.call([x, y + 1], visited)
      end
      level += 1
    end
  end

  (0..m - 1).each do |row|
    (0..n - 1).each do |col|
      bfs_from_house.call(row, col) if grid[row][col] == 1
    end
  end
  min_dist == max_value ? -1 : min_dist
end
