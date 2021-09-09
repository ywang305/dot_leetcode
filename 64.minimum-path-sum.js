/*
 * @lc app=leetcode id=64 lang=javascript
 *
 * [64] Minimum Path Sum
 */

// @lc code=start
/**
 * @param {number[][]} grid
 * @return {number}
 */
var minPathSum = function (grid) {
  const len = grid.length;
  const dp = Array.from({ length: len }, () => []);
  dp[0][0] = grid[0][0];
  for (let i = 0; i < len; ++i) {
    for (let j = 0; j < len; ++j) {
      if (!i && !j) continue;
      dp[i][j] =
        grid[i][j] +
        Math.min(dp[Math.max(i - 1, 0)][j], dp[i][Math.max(j - 1, 0)]);
    }
  }
  return dp[len - 1][len - 1];
};
// @lc code=end
