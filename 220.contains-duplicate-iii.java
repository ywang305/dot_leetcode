/*
 * @lc app=leetcode id=220 lang=java
 *
 * [220] Contains Duplicate III
 */

// @lc code=start
class Solution {
    public boolean containsNearbyAlmostDuplicate(int[] nums, int k, int t) {
        var tree = new TreeSet<Long>();
        for (int i = 0; i < nums.length; i++) {
            var floor = tree.floor((long) nums[i]);
            var ceil = tree.ceiling((long) nums[i]);
            if ((floor != null && Math.abs(floor - nums[i]) <= t) || (ceil != null && Math.abs(ceil - nums[i]) <= t)) {
                return true;
            }
            tree.add((long) nums[i]);
            if (i >= k) {
                tree.remove((long) nums[i - k]);
            }
        }
        return false;
    }
}
// @lc code=end

