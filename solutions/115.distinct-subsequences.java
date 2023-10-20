/*
 * @lc app=leetcode id=115 lang=java
 *
 * [115] Distinct Subsequences
 */

// @lc code=start
class Solution {
    /**
              Ø r a b b i t   ( target j )
            Ø 1 0 0 0 0 0 0
            r 1 1 0 0 0 0 0
(source i)  a 1 1 1 0 0 0 0
            b 1 1 1 1 0 0 0
            b 1 1 1 2 1 0 0
            b 1 1 1 3 3 0 0
            i 1 1 1 3 3 3 0
            t 1 1 1 3 3 3 3
    
     */
    public int numDistinct(String s, String t) {
        var s_len = s.length();
        var t_len = t.length();
        var dp = new int[s_len+1][t_len+1];
        dp[0][0] = 1; // empty string is a subsequence of empty string
        for(int i=1; i<s_len+1; ++i) dp[i][0] = 1; // 非空s字符串总是能匹配空串
        for(int j=1; j<t_len+1; ++j) dp[0][j] = 0; // 空s字符串不能匹配非空t字符串
        for(int i=1; i<s_len+1; ++i) {
            for(int j=1; j<t_len+1; ++j) {
                /*
                1. 对于s[i], t[j]匹配数，至少check s[i-]和 t[j]的匹配数
                2. 另外当当前字符相等时，还要check s[i-]和 t[j-1]的匹配数（tricky)
                */
                dp[i][j] = dp[i-1][j] + ( s.charAt(i-1)==t.charAt(j-1) ? dp[i-1][j-1] : 0 ); 
            }
        }
        return dp[s_len][t_len];
    }
}
// @lc code=end

