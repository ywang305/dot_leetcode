/*
 * @lc app=leetcode id=132 lang=javascript
 *
 * [132] Palindrome Partitioning II
 */

// @lc code=start
/**
 * @param {string} s
 * @return {number}
 */
var minCut = function (s) {
  // 双DP，dp[i]表示s[0...i]是否是回文串，dp2[i] 表示s[0...i]的最小分割数
  const dp = Array.from({ length: s.length }, () => []),
    dp2 = [];
  for (let j = 0; j < s.length; ++j) {
    dp2[j] = j; // the worst case, [a]->0, [a,b]->1, [a,b,c]->2,...

    for (let i = 0; i <= j; ++i) {
      dp[i][j] = s[i] === s[j] && (j - i <= 2 || dp[i + 1][j - 1]);
      if (dp[i][j]) {
        if (i === 0) {
          dp2[j] = 0; // s[0...j] is a palindrome -> 0 cuts
          break;
        } else {
          dp2[j] = Math.min(dp2[j], dp2[i - 1] + 1); // key1
        }
      }
    }
  }
  return dp2[s.length - 1];
};
// @lc code=end

/*
key1:
  dp2[i-1] + 1 ?
  dp2[i-1=+1 given s[i..j] is a palindrome, add 1 cut between s[0..i-1] and s[i..j]
*/

console.log(minCut("aaabaaabaababab"));
