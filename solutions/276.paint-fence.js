/**
 * https://www.algoninjutsu.com/post/216/
 *
 * @param {number} n
 * @param {number} k
 * @return {number}
 */
var numWays = function (n, k) {
  const dp = [k, k * k];
  for (let i = 2; i < n; ++i) {
    dp[i] = (k - 1) * (dp[i - 1] + dp[i - 2]);
  }
  return dp[n - 1];
};
