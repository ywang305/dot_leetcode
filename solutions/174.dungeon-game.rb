# @param {Integer[][]} dungeon
# @return {Integer}
def calculate_minimum_hp(dungeon)
  m = dungeon.length
  n = dungeon[0].length
  dp = Array.new(m) { Array.new(n) }
  (m-1).downto(0) do |i|
    (n-1).downto(0) do |j|
      if i == m-1 && j == n-1
        cur = dungeon[i][j]
      elsif i == m-1
        cur = dungeon[i][j] + dp[i][j+1]
      elsif j == n-1
        cur = dungeon[i][j] + dp[i+1][j]
      else
        cur = dungeon[i][j] + max(dp[i][j+1], dp[i+1][j])
      end
      dp[i][j] = cur.positive? ? 0 : cur
    end
  end
  -dp[0][0] + 1
end

def max(*vals) = vals.max
