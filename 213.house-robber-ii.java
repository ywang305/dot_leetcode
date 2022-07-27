/*
 * @lc app=leetcode id=213 lang=java
 *
 * [213] House Robber II
 */

// @lc code=start
class Solution {
    public int rob(int[] nums) {
        int n = nums.length;
        if(n==1) return nums[0];
        int noRobFirst = linearRob(Arrays.copyOfRange(nums, 1, n));
        int noRobLast = linearRob(Arrays.copyOfRange(nums, 0, n-1));
        return Math.max(noRobFirst, noRobLast);
    }
    
    int linearRob(int[] nums) {
        int n = nums.length;
        Rec[] dp = new Rec[n];
        dp[0] = new Rec(nums[0], 0);
        for(int i=1; i<n; ++i) {
            dp[i] = new Rec(dp[i-1].noop()+nums[i], dp[i-1].max());
        }
        return dp[n-1].max();
    }
    
    record Rec(int op, int noop){
        int max() {
            return Math.max(this.op, this.noop);
        }
    }
}
// @lc code=end

