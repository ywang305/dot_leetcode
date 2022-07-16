/*
 * @lc app=leetcode id=84 lang=java
 *
 * [84] Largest Rectangle in Histogram
 */

// @lc code=start
class Solution {
    /**
    首先，要想找到第 i 位置最大面积是什么？
    是以i 为中心，向左找第一个小于 heights[i] 的位置 left_i；向右找第一个小于于 heights[i] 的位置 right_i

    作者：powcai
    链接：https://leetcode.cn/problems/largest-rectangle-in-histogram/solution/zhao-liang-bian-di-yi-ge-xiao-yu-ta-de-zhi-by-powc/
    */
    public int largestRectangleArea(int[] heights) {
        var stack = new Stack<Integer>();
        var n = heights.length;
        
        var left = new int[n]; //track left that first val < cur
        for(int i=0; i<n; ++i) {
            while(!stack.empty() && heights[stack.peek()]>=heights[i]) stack.pop();
            left[i] = stack.empty() ? -1 : stack.peek();
            stack.push(i);
        }
        
        stack.clear();
        
        var right = new int[n]; //track right that first val < cur
        for(int i=n-1; i>=0; --i) {
            while(!stack.empty() && heights[stack.peek()]>=heights[i]) stack.pop();
            right[i] = stack.empty() ? n : stack.peek();
            stack.push(i);
        }
        
        int ans = 0;
        for(int i=0; i<n; ++i) {
            // range (right[i], left[i]) is all vals >= heights[i], that is used for area calculation
            ans = Math.max(ans, (right[i] - left[i] -1) * heights[i]);
        }
        return ans;
    }
}
// @lc code=end

