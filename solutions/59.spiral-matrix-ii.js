/*
 * @lc app=leetcode id=59 lang=javascript
 *
 * [59] Spiral Matrix II
 */

// @lc code=start
/**
 * @param {number} n
 * @return {number[][]}
 */
var generateMatrix = function (n) {
  const dir = [
    { x: 0, y: 1 },
    { x: 1, y: 0 },
    { x: 0, y: -1 },
    { x: -1, y: 0 },
  ];
  const matrix = Array.from({ length: n }, () => []);
  const isValid = (x, y) => x >= 0 && y >= 0 && x < n && y < n && !matrix[x][y];

  let i = 1,
    row = 0,
    col = -1,
    dIndex = 0;
  while (i <= n * n) {
    const nextrow = row + dir[dIndex].x;
    const nextcol = col + dir[dIndex].y;
    if (!isValid(nextrow, nextcol)) {
      dIndex = (dIndex + 1) % 4;
      continue;
    }
    row = nextrow;
    col = nextcol;
    matrix[row][col] = i;
    ++i;
  }
  return matrix;
};
// @lc code=end
generateMatrix(3);
