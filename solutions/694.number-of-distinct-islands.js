/**
 * 
Example 1:


Input: grid = [[1,1,0,0,0],[1,1,0,0,0],[0,0,0,1,1],[0,0,0,1,1]]
Output: 1
 */

/**
 * @param {number[][]} grid
 * @return {number}
 */
var numDistinctIslands = function (grid) {
  const m = grid.length;
  const n = grid[0].length;

  const dfs = (x, y) => {
    if (!grid[x]?.[y]) return [];
    grid[x][y] = null;
    const r1 = dfs(x + 1, y);
    const r2 = dfs(x - 1, y);
    const r3 = dfs(x, y + 1);
    const r4 = dfs(x, y - 1);
    return [{ x, y }, ...r1, ...r2, ...r3, ...r4];
  };

  const set = new Set();
  for (let i = 0; i < m; ++i) {
    for (let j = 0; j < n; ++j) {
      if (grid[i][j]) {
        const island = dfs(i, j);
        const key = island.map(({ x, y }) => `${x - i},${y - j}`).join(",");
        set.add(key);
      }
    }
  }
  return set.size;
};
