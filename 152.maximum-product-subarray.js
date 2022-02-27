/*
 * @lc app=leetcode id=152 lang=javascript
 *
 * [152] Maximum Product Subarray
 */

// @lc code=start
/**
 * @param {number[]} nums
 * @return {number}
 */
var maxProduct = function (nums) {
  const dp = [{ min: nums[0], max: nums[0] }];
  for (let i = 1; i < nums.length; ++i) {
    const calcs = [nums[i], dp[i - 1].min * nums[i], dp[i - 1].max * nums[i]];
    dp[i] = {
      min: Math.min(...calcs),
      max: Math.max(...calcs),
    };
  }
  return Math.max(...dp.map((x) => x.max));
};
// @lc code=end
