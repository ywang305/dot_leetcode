/*
 * @lc app=leetcode id=1301 lang=java
 *
 * [1301] Number of Paths with Max Score
 */

// @lc code=start
class Solution {
    public int[] pathsWithMaxScore(List<String> board) {
        int n = board.size();
        int[][] dp = new int[n][n];
        int[][] cnt = new int[n][n];
        cnt[n-1][n-1] = 1;
        int MOD = (int)1e9+7;

        for(int i=n-1; i>=0; --i) {
            for(int j=n-1; j>=0; --j) {
                char c = board.get(i).charAt(j);
                if(Character.isLetter(c)) {
                    dp[i][j] = (c=='E' || c=='S') ? 0 : -1;
                } else {
                    dp[i][j] = c-'0';
                }
            }
        }
        for(int i=n-1; i>=0; --i) {
            for(int j=n-1; j>=0; --j) {
                if((i==n-1 && j==n-1) || dp[i][j]<0) continue;
                int max = 0, count = 0;
                if(i+1<n && dp[i+1][j]>=0 && cnt[i+1][j]>0) {
                    max = Math.max(max, dp[i+1][j]);
                }
                if(j+1<n && dp[i][j+1]>=0 && cnt[i][j+1]>0) {
                    max = Math.max(max, dp[i][j+1]);
                }
                if(i+1<n && j+1<n && dp[i+1][j+1]>=0 && cnt[i+1][j+1]>0) {
                    max = Math.max(max, dp[i+1][j+1]);
                }
                if(i+1<n && dp[i+1][j]==max && cnt[i+1][j]>0) {
                    count+=cnt[i+1][j];
                }
                if(j+1<n && dp[i][j+1]==max && cnt[i][j+1]>0) {
                    count+=cnt[i][j+1];
                }
                if(i+1<n && j+1<n && dp[i+1][j+1]==max && cnt[i+1][j+1]>0) {
                    count+=cnt[i+1][j+1];
                }
                dp[i][j] += max;
                cnt[i][j] = count%MOD;
            }
        }
        return new int[]{ dp[0][0], cnt[0][0] };
    }
}
// @lc code=end

