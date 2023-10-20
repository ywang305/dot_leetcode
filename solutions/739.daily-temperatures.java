/*
 * @lc app=leetcode id=739 lang=java
 *
 * [739] Daily Temperatures
 */

// @lc code=start
class Solution {
    public int[] dailyTemperatures(int[] temperatures) {
        Stack<Integer> stack = new Stack<>();
        int n = temperatures.length;
        int[] ans = new int[n];
        
        for(int i=n-1; i>=0; --i) {
            while(!stack.empty() && temperatures[stack.peek()] <= temperatures[i]) {
                stack.pop();
            }
            ans[i] = stack.empty()? 0 : stack.peek() - i;
            stack.push(i);
        }
        return ans;
    }
}
// @lc code=end

