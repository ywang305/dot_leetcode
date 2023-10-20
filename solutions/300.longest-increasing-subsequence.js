/*
 * @lc app=leetcode id=300 lang=javascript
 *
 * [300] Longest Increasing Subsequence
 */

// @lc code=start
/**
 * @param {number[]} nums
 * @return {number}
 */
var lengthOfLIS = function (nums) {
  const dp = [];
  for (let j = 0; j < nums.length; j++) {
    dp[j] = 1;
    for (let i = 0; i < j; ++i) {
      if (nums[i] < nums[j]) {
        dp[j] = Math.max(dp[j], dp[i] + 1);
      }
    }
  }
  return Math.max(...dp);
};
// @lc code=end
