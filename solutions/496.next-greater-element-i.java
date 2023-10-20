/*
 * @lc app=leetcode id=496 lang=java
 *
 * [496] Next Greater Element I
 */

// @lc code=start
class Solution {
    public int[] nextGreaterElement(int[] nums1, int[] nums2) {
        var stack = new Stack<Integer>();
        var map = new HashMap<Integer, Integer>();
        
        int m = nums1.length, n = nums2.length;
        int[] right = new int[n]; // track the right first greater number of nums2[i]
        for(var i=n-1; i>=0; --i) {
            while(!stack.empty() && stack.peek()<nums2[i]) {
                stack.pop();
            }
            map.put( nums2[i] , stack.empty() ? -1 : stack.peek() );
            stack.push(nums2[i]);
        }
        
        int[] ans = new int[m];
        for(var i=0; i<m; ++i) ans[i] = map.get(nums1[i]);
        return ans;
    }
}
// @lc code=end

