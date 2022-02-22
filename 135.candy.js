/*
 * @lc app=leetcode id=135 lang=javascript
 *
 * [135] Candy
 */

// @lc code=start
/**
 * @param {number[]} ratings
 * @return {number}
 */
var candy = function (ratings) {
  /** GREEDY:   TWO SCANS  */
  const len = ratings.length;
  const candys = Array.from({ length: len }, () => 1);
  for (let i = 1; i < len; ++i) {
    if (ratings[i] > ratings[i - 1]) {
      candys[i] = candys[i - 1] + 1;
    }
  }
  for (let i = len - 2; i >= 0; --i) {
    if (ratings[i] > ratings[i + 1]) {
      candys[i] = Math.max(candys[i], candys[i + 1] + 1);
    }
  }
  return candys.reduce((a, c) => a + c, 0);
};
// @lc code=end
