/*
 * @lc app=leetcode id=198 lang=javascript
 *
 * [198] House Robber
 */

// @lc code=start
/**
 * @param {number[]} nums
 * @return {number}
 */
var rob = function (nums) {
  const len = nums.length;
  const dp = Array.from({ length: len }, () => ({}));
  for (let i = 0; i < len; ++i) {
    if (i === 0) {
      dp[i].noop = 0;
      dp[i].rob = nums[i];
    } else {
      dp[i].noop = Math.max(dp[i - 1].noop, dp[i - 1].rob);
      dp[i].rob = dp[i - 1].noop + nums[i];
    }
  }
  const { noop, rob } = dp[len - 1];
  return Math.max(noop, rob);
};
// @lc code=end
