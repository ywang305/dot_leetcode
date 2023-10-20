/*
 * @lc app=leetcode id=122 lang=javascript
 *
 * [122] Best Time to Buy and Sell Stock II
 */

// @lc code=start
/**
 * @param {number[]} prices
 * @return {number}
 */
var maxProfit = function (prices) {
  //  方法1 ： DP 无限次买卖
  const dp = [];
  for (let i = 0; i < prices.length; ++i) {
    const p = prices[i];
    if (i === 0) {
      dp[i] = { buy: -p, sell: 0 };
    } else {
      dp[i] = {
        buy: Math.max(dp[i - 1].buy, -p + dp[i - 1].sell), //或啥也不做-持有(之前买入状态)， 或之前卖掉本次买入
        sell: Math.max(dp[i - 1].sell, p + dp[i - 1].buy), // 或啥也不做-保持（之前卖掉状态), 或之前买入本次卖掉
      };
    }
  }
  const { buy, sell } = dp[prices.length - 1];
  return Math.max(buy, sell);

  // 方法2: 贪婪, 只要在涨，就加到利润
  let profit = 0;
  for (let i = 1; i < prices.length; ++i) {
    profit += Math.max(prices[i] - prices[i - 1], 0);
  }
  return profit;
};
// @lc code=end
