/*
 * @lc app=leetcode id=5 lang=javascript
 *
 * [5] Longest Palindromic Substring
 */

// @lc code=start
/**
 * @param {string} s
 * @return {string}
 */
var longestPalindrome = function (s) {
  const len = s.length;
  const dp = Array.from({ length: len }, () => []);
  let lps = "";
  for (let j = 0; j < len; ++j) {
    for (let i = j; i >= 0; --i) {
      //classic  deduce, also check [516] longest palindromic subsequence
      if (s[i] === s[j] && (j - i <= 2 || dp[i + 1][j - 1] === true)) {
        dp[i][j] = true;
        const substr = s.slice(i, j + 1);
        if (substr.length > lps.length) {
          lps = substr;
        }
      }
    }
  }
  return lps;
};
// @lc code=end
