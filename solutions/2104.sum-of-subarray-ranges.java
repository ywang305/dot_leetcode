/*
 * @lc app=leetcode id=2104 lang=java
 *
 * [2104] Sum of Subarray Ranges
 */

// @lc code=start
class Solution {
    public long subArrayRanges(int[] nums) {
        return getCnt(nums, false) - getCnt(nums, true);
    }
    
    // 求子数组最大 / 最小 和
    // trap 值得注意的是，由于 nums[i] 存在相同元素，因此上述两边均取等号的做法会导致某些区间被重复计算，因此我们可以令最近右端点的部分不取等号，确保区间统计不重不漏。
    public long getCnt(int[] nums, boolean isMin) {
        var n = nums.length;
        var stack = new Stack<Integer>();
        int[] left = new int[n], right = new int[n];
        
        // 求左边界第一个比cur还小的位置， e.g. 对于最小值来说，即在左范围（stack's index， num's index] num贡献最小值 
        for(int i=0; i<n; ++i) {
            while(!stack.empty() && ( isMin? nums[stack.peek()]>=nums[i] : nums[stack.peek()]<=nums[i]) ) {
                stack.pop();
            }
            left[i] = stack.empty() ? -1 : stack.peek();
            stack.push(i);
        }
        
        stack.clear();
        // 求右边界 index， e.g. 对于最小值来说，即在右范围 [num's index, stack's index) num贡献最小值
        for(int i=n-1; i>=0; --i) {
            while(!stack.empty() && ( isMin? nums[stack.peek()]>nums[i] : nums[stack.peek()]<nums[i]) ) {
                stack.pop();
            }
            right[i] = stack.empty() ? n : stack.peek();
            stack.push(i);
        }
        
        long ans = 0;
        for(int i=0; i<n; ++i) {
            ans += (long) nums[i] * (i-left[i]) * (right[i]-i); // 贡献值的组合成法
        }
        return ans;
    }
}
// @lc code=end

