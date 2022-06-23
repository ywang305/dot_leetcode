/*
 * @lc app=leetcode id=96 lang=java
 *
 * [96] Unique Binary Search Trees
 */

// @lc code=start
class Solution {
    Map<Integer, Integer> map = new HashMap<>();
    
    public int numTrees(int n) {
        if(n<=1) return 1;
        if(map.containsKey(n)) return map.get(n);
        
        int ans = 0;
        for(int i=1; i<=n; ++i) {
            ans += numTrees(i-1)*numTrees(n-i); // key
        }
        map.put(n, ans);
        return ans;
    }
}
// @lc code=end

