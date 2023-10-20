/*
 * @lc app=leetcode id=329 lang=javascript
 *
 * [329] Longest Increasing Path in a Matrix
 */

// @lc code=start
/**
 * @param {number[][]} matrix
 * @return {number}
 */
var longestIncreasingPath = function (matrix) {
  /**
   * @param {number[][]} matrix
   * @return {number}
   */
  var longestIncreasingPath = function (matrix) {
    const map = new Map();
    const dfs = (x, y) => {
      const key = `${x},${y}`;
      if (map.has(key)) return map.get(key);

      const cur = matrix[x][y];
      let s1 = 0,
        s2 = 0,
        s3 = 0,
        s4 = 0;
      if (matrix[x + 1]?.[y] > cur) s1 = dfs(x + 1, y);
      if (matrix[x - 1]?.[y] > cur) s2 = dfs(x - 1, y);
      if (matrix[x][y + 1] > cur) s3 = dfs(x, y + 1);
      if (matrix[x][y - 1] > cur) s4 = dfs(x, y - 1);

      map.set(key, 1 + Math.max(s1, s2, s3, s4));
      return map.get(key);
    };

    const m = matrix.length;
    const n = matrix[0].length;
    let res = 0;
    for (let i = 0; i < m; ++i) {
      for (let j = 0; j < n; ++j) {
        res = Math.max(res, dfs(i, j));
      }
    }

    return res;
  };
};
// @lc code=end
