/*
 * @lc app=leetcode id=63 lang=javascript
 *
 * [63] Unique Paths II
 */

// @lc code=start
/**
 * @param {number[][]} obstacleGrid
 * @return {number}
 */
var uniquePathsWithObstacles = function (obstacleGrid) {
  const grid = obstacleGrid;
  const m = grid.length;
  const n = grid[0].length;
  for (let i = 0; i < m; ++i) {
    for (let j = 0; j < n; ++j) {
      if (grid[i][j] === 1) grid[i][j] = 0;
      else if (i === 0 && j === 0) grid[i][j] = 1 - grid[i][j];
      else if (i === 0) {
        grid[i][j] = grid[i][j - 1];
      } else if (j === 0) {
        grid[i][j] = grid[i - 1][j];
      } else {
        grid[i][j] = grid[i - 1][j] + grid[i][j - 1];
      }
    }
  }
  return grid[m - 1][n - 1];
};
// @lc code=end
