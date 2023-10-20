/*
 * @lc app=leetcode id=907 lang=java
 *
 * [907] Sum of Subarray Minimums
 */

// @lc code=start
class Solution {
    public int sumSubarrayMins(int[] arr) {
        int n = arr.length;
        final int mod = 1_000_000_000+7;
        
        Deque<Integer> stack = new LinkedList<>();
        int[] left = new int[n], right = new int[n];
        
        // 第一次循环先找到所有元素的左边界
        for(int i=0; i<n; ++i) {
            int num = arr[i];
            while(!stack.isEmpty() && arr[stack.peek()] > num) {
                stack.pop();
            }
            if(stack.isEmpty()) left[i] = -1;
            else left[i] = stack.peek();
            
            stack.push(i);
        }
        
        stack.clear();
        // 第二次循环找到所有元素的右边界
        for(int i=n-1; i>=0; --i) {
            int num = arr[i];
            while(!stack.isEmpty() && arr[stack.peek()] >= num) { // 注意⚠️：在计算左边界或者右边界时将一侧设置为求解小于等于E的元素，目的是为了解决当一个子数组中有两个最小值元素时（比如[3,1,2,4,1]中有两个1），不重复且不遗漏地统计每一个子数组。
                stack.pop();
            }
            if(stack.isEmpty()) right[i] = n;
            else right[i] = stack.peek();
            
            stack.push(i);
        }
        
        long ans = 0;
        for(int i=0; i<n; ++i) {
            ans = (ans + (long) (i - left[i]) * (right[i] - i) * arr[i]) % mod; 
        }
        return (int) ans;
    }
}
// @lc code=end

