/*
 * @lc app=leetcode id=309 lang=java
 *
 * [309] Best Time to Buy and Sell Stock with Cooldown
 */

// @lc code=start
class Solution {
    public int maxProfit(int[] prices) {
        int n = prices.length;
        int[][] dp = new int[n][4];
        dp[0][0] = 0; // no stock on hand => no_hold
        dp[0][1] = 0; // stock on hand, sell stock => no_hold
        dp[0][2] = -prices[0]; // stock on hand (not buy any sotck) => hold
        dp[0][3] = -prices[0]; // no stock on hand, buy stock => hold

        for(int i=1; i<n; ++i) {
            dp[i][0] = Math.max(dp[i-1][0], dp[i-1][1]); // 今天不持股票，继承前一天不持有股票的两种情况
            dp[i][1] = Math.max(dp[i-1][2], dp[i-1][3])+prices[i]; // 今天有股票并卖掉，则前一天是持有股票的两种情况
            dp[i][2] = Math.max(dp[i-1][2], dp[i-1][3]); //今天没买股票，却持有股票，继承前一天是持有股票的两种情况
            dp[i][3] = dp[i-1][0]-prices[i]; //今天买入股票，这前一天一定没有卖出股票
        }
        return Math.max(dp[n-1][0], dp[n-1][1]);
    }
}
// @lc code=end

