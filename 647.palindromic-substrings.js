/*
 * @lc app=leetcode id=647 lang=javascript
 *
 * [647] Palindromic Substrings
 */

// @lc code=start
/**
 * @param {string} s
 * @return {number}
 */
var countSubstrings = function (s) {
  const len = s.length;
  const dp = Array.from({ length: len }, () => []);
  let count = 0;
  for (let j = 0; j < len; ++j) {
    for (let i = 0; i <= j; ++i) {
      if (s[i] === s[j] && (j - i <= 1 || dp[i + 1][j - 1])) {
        // 关键推导， LCS也是这个推导
        dp[i][j] = true;
        count++;
      } else {
        dp[i][j] = false;
      }
    }
  }
  return count;
};
// @lc code=end
