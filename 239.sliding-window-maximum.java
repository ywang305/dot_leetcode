/*
 * @lc app=leetcode id=239 lang=java
 *
 * [239] Sliding Window Maximum
 */

// @lc code=start
class Solution {
    public int[] maxSlidingWindow(int[] nums, int k) {
        int n = nums.length;
        int[] ans = new int[n-k+1];
        Deque<Integer> q = new ArrayDeque<>();
        for(int i=0; i<n; ++i) {
            int num = nums[i];
            while(!q.isEmpty() && num > q.peekLast()) q.removeLast();
            q.addLast(num);
            int j = i-k+1;
            if(j>=0 && j<=n-k) {
                ans[j] = q.peekFirst();
                if(nums[j]==q.peekFirst()) q.removeFirst();
            }
        }
        return ans;
    }
}
// @lc code=end

