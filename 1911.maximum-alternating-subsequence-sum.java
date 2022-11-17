/*
 * @lc app=leetcode id=1911 lang=java
 *
 * [1911] Maximum Alternating Subsequence Sum
 */

// @lc code=start
class Solution {
    public long maxAlternatingSum(int[] nums) {
        int n = nums.length;
        long[] oddMax = new long[n];
        long[] evenMax = new long[n];
        oddMax[0] = 0;
        evenMax[0] = nums[0];
        for(int i=1; i<n; ++i) {
            oddMax[i] = Math.max(oddMax[i-1], evenMax[i-1]-nums[i]);
            evenMax[i] = Math.max(evenMax[i-1], Math.max(nums[i], oddMax[i-1]+nums[i]));
        }
        return Math.max(oddMax[n-1], evenMax[n-1]);
    }
}
// @lc code=end

