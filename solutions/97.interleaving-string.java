/*
 * @lc app=leetcode id=97 lang=java
 *
 * [97] Interleaving String
 */

// @lc code=start
class Solution {
    /**  
        j -> 
          Ø d b b c a
     i  Ø T F F F F F
     |  a T F F F F F
    \/  a T T T T T F
        b F T T F T F
        c F F T T T T
        c F F F T F T
    **/
    public boolean isInterleave(String s1, String s2, String s3) {
        int m = s1.length(), n = s2.length();
        if(s3.length() != m+n) return false;
        
        var dp = new boolean[m+1][n+1];
        dp[0][0] = true;
        for(int i=1; i<m+1; ++i) dp[i][0] = dp[i-1][0] && s1.charAt(i-1)==s3.charAt(i-1);
        for(int j=1; j<n+1; ++j) dp[0][j] = dp[0][j-1] && s2.charAt(j-1)==s3.charAt(j-1);
        for(int i=1; i<m+1; ++i) {
            for(int j=1; j<n+1; ++j) {
                dp[i][j] = (dp[i-1][j] && s1.charAt(i-1) == s3.charAt(i+j-1)) || (dp[i][j-1] && s2.charAt(j-1) == s3.charAt(i+j-1));
            }
        }
        return dp[m][n];
    }
}
// @lc code=end

