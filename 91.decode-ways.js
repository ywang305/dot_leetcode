/*
 * @lc app=leetcode id=91 lang=javascript
 *
 * [91] Decode Ways
 */

// @lc code=start
/**
 * @param {string} s
 * @return {number}
 */
var numDecodings = function (s) {
  if (s[0] === "0") return 0; //排除开头为0的异常情况

  const dp = [1, 1]; //第一个字符必然只有一种解码方法赋值f[1]为1，为了能够正确推导我们要将f[0]也初始化为1
  for (let i = 2; i <= s.length; ++i) {
    dp[i] = 0;
    if (s[i - 1] !== "0") {
      dp[i] = dp[i - 1];
    }
    const twoDigit = parseInt(s.slice(i - 2, i));
    if (twoDigit >= 10 && twoDigit <= 26) {
      dp[i] += dp[i - 2];
    }
  }
  return dp[s.length];
};
// @lc code=end
