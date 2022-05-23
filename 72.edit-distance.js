/*
 * @lc app=leetcode id=72 lang=javascript
 *
 * [72] Edit Distance
 */

// @lc code=start
/**
 * @param {string} word1
 * @param {string} word2
 * @return {number}
 */
var minDistance = function (word1, word2) {
  const m = word1.length;
  const n = word2.length;
  const dp = Array.from({ length: m + 1 }, () => []);
  for (let i = 0; i <= m; ++i) {
    for (let j = 0; j <= n; ++j) {
      if (i == 0 || j == 0) {
        dp[i][j] = i === 0 ? j : i;
      } else if (word1[i - 1] == word2[j - 1]) {
        // 小心， dp[i][j] 对应word是 i-1， j-1
        dp[i][j] = dp[i - 1][j - 1];
      } else {
        dp[i][j] = Math.min(dp[i - 1][j], dp[i][j - 1], dp[i - 1][j - 1]) + 1;
      }
    }
  }
  return dp[m][n];
};
// @lc code=end
