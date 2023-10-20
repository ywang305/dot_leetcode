/*
 * @lc app=leetcode id=188 lang=javascript
 *
 * [188] Best Time to Buy and Sell Stock IV
 */

// @lc code=start
/**
 * @param {number} k
 * @param {number[]} prices
 * @return {number}
 */
var maxProfit = function (k, prices) {
  const len = prices.length;
  if (len == 0) return 0;

  const dp = Array.from({ length: k + 1 }, () =>
    Array.from({ length: len }, () => ({}))
  );

  // 初始化第零天状态
  for (let act = 0; act <= k; ++act) {
    dp[act][0].no_hold = 0;
    dp[act][0].hold = -prices[0];
  }

  // 初始化0次交易。 0次交易是不合理的存在，所以dp长度是 k+1
  for (let day = 1; day < len; day++) {
    dp[0][day].no_hold = 0;
    dp[0][day].hold = Number.MIN_VALUE;
  }

  for (let act = 1; act <= k; ++act) {
    for (let day = 1; day < len; ++day) {
      /**
       * 不持有股票分两种情况
       * 1：前一天不持有，今天无操作
       * 2: 前一天持有，今天卖了
       * 因为无买入操作，所以是在同一个act维度
       */
      dp[act][day].no_hold = Math.max(
        dp[act][day - 1].no_hold,
        dp[act][day - 1].hold + prices[day]
      );
      /**
       * 持有股票分两种情况
       * 1：前一天不持有，今天买入， 买入是一个新的act，所以前一天的交易是act-1维度
       * 2: 前一天持有，今天无操作， 不耗费act，所以是same act 维度
       */
      dp[act][day].hold = Math.max(
        dp[act - 1][day - 1].no_hold - prices[day],
        dp[act][day - 1].hold
      );
    }
  }

  return dp[k][len - 1].no_hold;
};
// @lc code=end
maxProfit(1, [1, 2]);
