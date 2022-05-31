/*
 * @lc app=leetcode id=74 lang=javascript
 *
 * [74] Search a 2D Matrix
 */

// @lc code=start
/**
 * @param {number[][]} matrix
 * @param {number} target
 * @return {boolean}
 */
var searchMatrix = function (matrix, target) {
  const m = matrix.length;
  const n = matrix[0].length;
  let i = 0,
    j = m - 1;
  let res = m;
  // highbound:  first that > target
  while (i <= j) {
    let m = Math.floor(i + (j - i) / 2);
    if (matrix[m][0] <= target) {
      i = m + 1;
    } else {
      j = m - 1;
      res = m;
    }
  }
  if (res - 1 < 0) return false;

  i = 0;
  j = n - 1;
  while (i <= j) {
    let m = Math.floor(i + (j - i) / 2);
    if (matrix[res - 1][m] < target) {
      i = m + 1;
    } else if (matrix[res - 1][m] > target) {
      j = m - 1;
    } else {
      return true;
    }
  }
  return false;
};
// @lc code=end
searchMatrix([[1]], 1);
