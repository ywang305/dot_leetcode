/*
 * @lc app=leetcode id=516 lang=javascript
 *
 * [516] Longest Palindromic Subsequence
 */

// @lc code=start
/**
 * @param {string} s
 * @return {number}
 */
var longestPalindromeSubseq = function (s) {
  const len = s.length;
  const dp = Array.from({ length: len }, () =>
    Array.from({ length: len }, () => 0)
  ); // i, j 范围的最大LPS
  for (let j = 0; j < len; ++j) {
    for (let i = j; i >= 0; --i) {
      if (s[i] === s[j]) {
        if (j - i <= 1) dp[i][j] = j - i + 1;
        // i==j, then LPS is 1 , or j-i==1 then LPS is 2
        else dp[i][j] = dp[i + 1][j - 1] + 2;
      } else {
        dp[i][j] = Math.max(dp[i + 1][j], dp[i][j - 1]);
      }
    }
  }
  return dp[0][len - 1];
};
// @lc code=end
console.log(longestPalindromeSubseq("cbbd"));
