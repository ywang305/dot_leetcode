/*
 * @lc app=leetcode id=301 lang=java
 *
 * [301] Remove Invalid Parentheses
 */

// @lc code=start
class Solution {
    String s;
    int curLen;
    int max; // 记录最大有效括号数量
    Set<String> set = new HashSet<>();

    public List<String> removeInvalidParentheses(String s) {
        this.s = s;
        int l = 0, r = 0;
        for(var c : s.toCharArray()) {
            if(c=='(') ++l;
            else if(c==')') ++r;
        }
        this.max = Math.min(l,r);

        dfs(0, "", 0);
        return new ArrayList<>(set);
    }

    void dfs(int start, String cur, int score) {
        if(score<0 || score>max) return;
        if(start==s.length()) {
            if(cur.length() >= curLen && score==0) {
                if(cur.length() > curLen) set.clear();
                curLen = cur.length();
                set.add(cur);
            }
            return;
        }

        char c = s.charAt(start);
        if(c=='(') { // 括号，选或不选
            dfs(start+1, cur+c, score+1);
            dfs(start+1, cur, score);
        } else if(c==')') { // 括号，选或不选
            dfs(start+1, cur+c, score-1);
            dfs(start+1, cur, score);
        } else { // 其它字符直接加入
            dfs(start+1, cur+c, score);
        }
    }
}
// @lc code=end

