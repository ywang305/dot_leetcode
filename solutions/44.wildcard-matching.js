/*
 * @lc app=leetcode id=44 lang=javascript
 *
 * [44] Wildcard Matching
 */

// @lc code=start
/**
 * @param {string} s
 * @param {string} p
 * @return {boolean}
 */
var isMatch = function (s, p) {
  /**
   *  - 大小初始化为 (m+1) x (n+1)，加 1 的原因是要包含 s 和 p 都为空的话，也应该返回 true，所以也要初始化 dp[0][0] 为 true。
      - 还需要提前处理的一种情况是，当 s 为空，p 为连续的星号时的情况。由于星号是可以代表空串的，所以只要 s 为空，那么连续的星号的位置都应该为 true，所以先将连续星号的位置都赋为 true。
      - 然后就是推导一般的状态转移方程了，如何更新 dp[i][j]，首先处理比较 tricky 的情况，若 p 中第 j 个字符是星号，
        由于星号可以匹配空串，所以如果 p 中的前 j-1 个字符跟 s 中前 i 个字符匹配成功了（ dp[i][j-1] 为 true）的话，则 dp[i][j] 也能为 true。
        或者若 p 中的前 j 个字符跟 s 中的前 i-1 个字符匹配成功了（ dp[i-1][j] 为 true ）的话，则 dp[i][j] 也能为 true（因为星号可以匹配任意字符串，再多加一个任意字符也没问题）
   */
  let m = s.length,
    n = p.length;
  const dp = Array.from({ length: m + 1 }, () => []);
  dp[0][0] = true;
  for (let i = 1; i < n + 1; ++i) {
    if (p[i - 1] === "*") dp[0][i] = dp[0][i - 1];
  }
  for (let i = 1; i < m + 1; ++i) {
    for (let j = 1; j < n + 1; ++j) {
      if (p[j - 1] === "*") {
        dp[i][j] = dp[i - 1][j] || dp[i][j - 1];
      } else {
        dp[i][j] =
          dp[i - 1][j - 1] && (s[i - 1] === p[j - 1] || p[j - 1] === "?");
      }
    }
  }
  return dp[m][n] === true;
};
// @lc code=end
