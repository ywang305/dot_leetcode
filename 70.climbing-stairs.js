/*
 * @lc app=leetcode id=70 lang=javascript
 *
 * [70] Climbing Stairs
 */

// @lc code=start
/**
 * @param {number} n
 * @return {number}
 */
var climbStairs = function (n, m = new Map()) {
  if (n <= 2) return n;
  if (m.has(n)) return m.get(n);

  const solutinon = climbStairs(n - 1, m) + climbStairs(n - 2, m);
  m.set(n, solutinon);
  return solutinon;
};
// @lc code=end
