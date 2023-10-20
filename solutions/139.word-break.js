/*
 * @lc app=leetcode id=139 lang=javascript
 *
 * [139] Word Break
 */

// @lc code=start
/**
 * @param {string} s
 * @param {string[]} wordDict
 * @return {boolean}
 */
var wordBreak = function (s, wordDict) {
  const dp = [true];
  for (let j = 1; j <= s.length; ++j) {
    for (let i = 0; i < j; ++i) {
      if (dp[i] && wordDict.includes(s.slice(i, j))) {
        dp[j] = true;
        break;
      }
    }
  }
  return Boolean(dp[s.length]);
};
// @lc code=end
wordBreak("leetcode", ["leet", "code"]);
