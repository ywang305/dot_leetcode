/*
 * @lc app=leetcode id=121 lang=javascript
 *
 * [121] Best Time to Buy and Sell Stock
 */

// @lc code=start
/**
 * @param {number[]} prices
 * @return {number}
 */
var maxProfit = function (prices) {
  const dp = [0]; // profit at i, first day is 0
  let minprice = prices[0];
  for (let i = 1; i < prices.length; ++i) {
    minprice = Math.min(prices[i], minprice);
    dp[i] = Math.max(dp[i - 1], prices[i] - minprice); // 或者不卖，维持dp[i-1]的profit，或卖掉 当前价-已知的最小值
  }
  return dp[prices.length - 1];
};
// @lc code=end
