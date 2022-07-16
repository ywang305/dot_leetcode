/*
 * @lc app=leetcode id=926 lang=java
 *
 * [926] Flip String to Monotone Increasing
 */

// @lc code=start
class Solution {
    // 解法1  PreSum
    public int minFlipsMonoIncr(String s) {
        var n = s.length();
        var presum = new int[n+1]; // 前面的字符中(不包含当前字符)有多少个1
        int ans = Integer.MAX_VALUE;
        for(int i=1; i<=n; ++i) {
            presum[i] = presum[i-1] + s.charAt(i-1) - '0';
        }
        for(int i=0; i<=n; ++i) {
            ans = Math.min(ans, presum[i] + n - i - (presum[n] - presum[i]));
            //                  ^^^^^^^^    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
            //           当前字符前面1的数量       当前字符包括当前字符后面0的数量
        }
        return ans;
    }
    
    // 解法2 DP
    public int minFlipsMonoIncr(String s) {
        int n = s.length();
        int[][] dp = new int[n][2];
        dp[0]['1'-s.charAt(0)] += 1; // 初始化： 当前字符‘0’， 得到dp[0][1]则需要+1； 同理 当前字符‘1’， 得到dp[0][0]则需要+1； 
        for(int i=1; i<n; ++i) {
            dp[i][0] = dp[i-1][0];  //current '0' 只能从前一个状态‘0’转移过来（因为题设 Monotone Increasing）
            dp[i][1] = Math.min(dp[i-1][0], dp[i-1][1]); // current ‘1’可能从前一个‘0’或‘1’推导来
            dp[i]['1'-s.charAt(i)] += 1;
        }
        return Math.min(dp[n-1][0], dp[n-1][1]);
    }
}
// @lc code=end

