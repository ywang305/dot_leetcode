/*
 * @lc app=leetcode id=179 lang=javascript
 *
 * [179] Largest Number
 */

// @lc code=start
/**
 * @param {number[]} nums
 * @return {string}
 */
var largestNumber = function (nums) {
  const res = nums
    .map(String)
    .sort((a, b) => {
      if (a + b === b + a) return 0;
      return a + b < b + a ? 1 : -1;
    })
    .join("");
  return res[0] === "0" ? "0" : res;
};
// @lc code=end
