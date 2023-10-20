/*
 * @lc app=leetcode id=241 lang=java
 *
 * [241] Different Ways to Add Parentheses
 */

// @lc code=start
class Solution {
    String exp;
    public List<Integer> diffWaysToCompute(String expression) {
        exp = expression;
        return dfs(0, exp.length()-1);
    }
    
    List<Integer> dfs(int left, int right) {
        if(left>right) return List.of();
        
        List<Integer> ans = new ArrayList<>();
        for(int i=left; i<=right; ++i) {
            char c = exp.charAt(i);
            if(c>='0' && c<='9') continue;
            List<Integer> lefts = dfs(left, i-1), rights = dfs(i+1, right);
            for(var a : lefts) {
                for(var b: rights) {
                    int cur = 0;
                    if(c=='+') cur = a+b;
                    else if(c=='-') cur = a-b;
                    else cur = a*b;
                    ans.add(cur);
                }
            }
        }
        if(ans.isEmpty()) {
            var cur = Integer.valueOf(exp.substring(left, right+1));
            ans.add(cur);
        }
        return ans;
    }
}
// @lc code=end

