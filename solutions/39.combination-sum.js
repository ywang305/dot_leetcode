/*
 * @lc app=leetcode id=39 lang=javascript
 *
 * [39] Combination Sum
 */

// @lc code=start
/**
 * @param {number[]} candidates
 * @param {number} target
 * @return {number[][]}
 */
var combinationSum = function (candidates, target, start = 0) {
  if (target < 0) {
    return [];
  }
  if (target === 0) {
    return [[]];
  }

  const res = [];
  for (let i = start; i < candidates.length; i++) {
    const cur = candidates[i];
    /**
     参数
      candiates.slice(i)因为解可以包括重估元素 如'2':  [2,2,3]
      如果直接用 candidates 会存在重复解 如 [2,2,3], [2,3,2], [3,2,2]
    */
    const subArrs = combinationSum(candidates, target - cur, i);
    subArrs.forEach((subArr) => res.push([cur, ...subArr]));
  }
  return res;
};
// @lc code=end

combinationSum([2, 3, 6, 7], 7);
