/*
 * @lc app=leetcode id=300 lang=java
 *
 * [300] Longest Increasing Subsequence
 */

// @lc code=start
class Solution {
    public int lengthOfLIS(int[] nums) {
        int n = nums.length;
        int[] dp = new int[n];
        for(int j=0; j<n; ++j) {
            dp[j] = 1;
            for(int i=0; i<j; ++i) {
                if(nums[i] < nums[j]) {
                    dp[j] = Math.max(dp[j], dp[i]+1);
                }  
            }
        }
        return Arrays.stream(dp).max().getAsInt();
    }
}
// @lc code=end

