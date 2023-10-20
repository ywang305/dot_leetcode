/*
 * @lc app=leetcode id=53 lang=javascript
 *
 * [53] Maximum Subarray
 */

// @lc code=start
/**
 * @param {number[]} nums
 * @return {number}
 */
var maxSubArray = function (nums) {
  //动态规划 dp记录最大值
  const dp = [nums[0]];
  for (let i = 1; i < nums.length; ++i) {
    dp[i] = Math.max(dp[i - 1] + nums[i], nums[i]);
  }
  return Math.max(...dp);
};
// @lc code=end

maxSubArray([-2, 1, -3, 4, -1, 2, 1, -5, 4]);
