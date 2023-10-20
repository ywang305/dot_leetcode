/*
 * @lc app=leetcode id=40 lang=javascript
 *
 * [40] Combination Sum II
 */

// @lc code=start
/**
 * @param {number[]} candidates
 * @param {number} target
 * @return {number[][]}
 */
var combinationSum2 = function (candidates, target, start = 0) {
  if (target < 0) return [];
  if (target === 0) return [[]];
  if (start === 0) candidates.sort((a, b) => a - b);

  const res = [];
  for (let i = start; i < candidates.length; ++i) {
    if (i > start && candidates[i] === candidates[i - 1]) continue; //易错ignore i>start
    const cur = candidates[i];
    combinationSum2(candidates, target - cur, i + 1).forEach((subArr) => {
      res.push([cur, ...subArr]);
    });
  }
  return res;
};
// @lc code=end

console.log(combinationSum2([1, 1, 6, 7], 8));
