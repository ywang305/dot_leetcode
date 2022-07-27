/*
 * @lc app=leetcode id=209 lang=java
 *
 * [209] Minimum Size Subarray Sum
 */

// @lc code=start
class Solution {
    public int minSubArrayLen(int target, int[] nums) {
        int n = nums.length;
        int i=0, j=0;
        int sum = 0;
        int ans = n+1;
        while(j<n) {
            sum+=nums[j];
            while(sum >= target) {
                ans = Math.min(ans, j-i+1);
                sum -= nums[i++];
            }             
            ++j;
        }
        return ans = ans==n+1 ? 0 : ans;
    }
}
// @lc code=end

