/*
 * @lc app=leetcode id=32 lang=javascript
 *
 * [32] Longest Valid Parentheses
 */

// @lc code=start
/**
 * @param {string} s
 * @return {number}
 */
var longestValidParentheses = function (s) {
  if (s.length < 2) return 0;
  const dp = Array.from({ length: s.length }, () => 0);
  for (let i = 0; i < s.length; ++i) {
    if (s[i] === ")") {
      if (s[i - 1] === "(") {
        dp[i] = (dp[i - 2] ?? 0) + 2;
      } else if (s[i - dp[i - 1] - 1] === "(") {
        dp[i] = dp[i - 1] + (dp[i - dp[i - 1] - 2] ?? 0) + 2;
      }
    }
  }
  return Math.max(...dp);
};
// @lc code=end
