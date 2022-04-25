/*
 * @lc app=leetcode id=11 lang=javascript
 *
 * [11] Container With Most Water
 */

// @lc code=start
/**
 * @param {number[]} height
 * @return {number}
 */
var maxArea = function (height) {
  let res = 0;
  let i = 0,
    j = height.length - 1;
  while (i < j) {
    res = Math.max(res, Math.min(height[i], height[j]) * (j - i));
    height[i] < height[j] ? i++ : j--;
  }
  return res;
};
// @lc code=end
