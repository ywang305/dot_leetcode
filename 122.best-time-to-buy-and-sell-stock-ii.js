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
  //  方法1 ： 分清 顶 和 谷底
  /** 
  let bottom = prices[0],
    top = bottom,
    profit = 0;
  for (let i = 1; i < prices.length; ++i) {
    if (prices[i] > prices[i - 1]) {
      top = prices[i];
    } else {
      profit += top - bottom;
      top = bottom = prices[i];
    }
  }
  profit += top - bottom; // 如果一直涨，需要这一步
  return profit;
  */

  // 方法2: 贪婪, 只要在涨，就加到利润
  let profit = 0;
  for (let i = 1; i < prices.length; ++i) {
    profit += Math.max(prices[i] - prices[i - 1], 0);
  }
  return profit;
};
// @lc code=end
