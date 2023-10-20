/*
 * @lc app=leetcode id=54 lang=javascript
 *
 * [54] Spiral Matrix
 */

// @lc code=start
/**
 * @param {number[][]} matrix
 * @return {number[]}
 */
var spiralOrder = function (matrix) {
  const m = matrix.length;
  const n = matrix[0].length;
  const dir = ["r", "d", "l", "u"];
  const isValid = (x, y) => {
    return x >= 0 && x < m && y >= 0 && y < n && matrix[x][y] !== null;
  };

  const res = [];
  const dfs = (x, y, dir) => {
    res.push(matrix[x][y]);
    matrix[x][y] = null;
    if (dir === "r") {
      if (isValid(x, y + 1)) dfs(x, y + 1, dir);
      else if (isValid(x + 1, y)) dfs(x + 1, y, "d");
      else return;
    }
    if (dir === "d") {
      if (isValid(x + 1, y)) dfs(x + 1, y, "d");
      else if (isValid(x, y - 1)) dfs(x, y - 1, "l");
      else return;
    }
    if (dir === "l") {
      if (isValid(x, y - 1)) dfs(x, y - 1, "l");
      else if (isValid(x - 1, y)) dfs(x - 1, y, "u");
      else return;
    } else {
      if (isValid(x - 1, y)) dfs(x - 1, y, "u");
      else if (isValid(x, y + 1)) dfs(x, y + 1, "r");
      else return;
    }
  };

  dfs(0, 0, "r");
  return res;
};
// @lc code=end
