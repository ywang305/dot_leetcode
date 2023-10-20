/*
 * @lc app=leetcode id=260 lang=java
 *
 * [260] Single Number III
 */

// @lc code=start
class Solution {
    public int[] singleNumber(int[] nums) {
        int ab = 0;
        for(int num : nums) {
            ab ^= num;
        }
        // 找ab中任意一位为1的bit，（这里找的是最后一位）， 用作区分
        int lastOne = ~(ab-1) & ab;
        int a = 0, b = 0;
        for(int num : nums) {
            if((num & lastOne) > 0) { // do the trick
                a ^= num;
            } else {
                b ^= num;
            }
        }
        return new int[]{a, b};
    }
}
// @lc code=end

