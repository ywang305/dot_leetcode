/*
 * @lc app=leetcode id=216 lang=java
 *
 * [216] Combination Sum III
 */

// @lc code=start
class Solution {
    List<List<Integer>> ans = new ArrayList<>();
    LinkedList<Integer> temp = new LinkedList<>();
    
    public List<List<Integer>> combinationSum3(int k, int n) {
        dfs(1, k, n);
        return ans;
    }
    
    void dfs(int start, int k, int n) {
        if(n<0) return;
        if(k==0) {
            if(n==0) ans.add( new ArrayList(temp) );
            return;
        }
        for(int i=start; i<=9; ++i) {
            temp.add(i);
            dfs(i+1, k-1, n-i);
            temp.removeLast();
        }
    }
}
// @lc code=end

