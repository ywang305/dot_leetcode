/*
 * @lc app=leetcode id=287 lang=java
 *
 * [287] Find the Duplicate Number
 */

// @lc code=start
class Solution {
    public int findDuplicate(int[] nums) {
        int n = nums.length;
        int res = 0;
        for(int i=0; i<32; ++i) {
            int bit = 1<<i;
            int cnt1 = 0, cnt2 = 0;
            for(int k=0; k<n; ++k) {
                if((nums[k] & bit) > 0) ++cnt1;  // nums[k] 可能有重复
                if(k+1<n && ((k+1) & bit) > 0) ++cnt2; //k+1 是不重复的数, 即使k+1这个数未出现在nums中也ok，因为cnt1>cnt2不会考虑这个数字(k+1)
            }
            if(cnt1>cnt2) res += bit; // 说明此位bit是重复的
        }
        return res;
    }
}
// @lc code=end

