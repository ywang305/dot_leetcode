
class Solution {
    public int countHousePlacements(int n) {
        int M = 1000000007;
        
        var put = new long[n+1]; // trick using long to avoid overflow
        var notPut = new long[n+1];
        put[1] = notPut[1] = 1;
        for (int i = 2; i <= n; i++) {
            put[i] = notPut[i-1];
            notPut[i] = (notPut[i-1] + put[i-1])%M;
        }
        return (int) ((put[n]+notPut[n])*(put[n]+notPut[n])%M);
    }
}

class Solution {
    public int countHousePlacements(int n) {
        int M = 1000000007;
        
        var dp = new long[n+1];
        dp[0]=1; dp[1]=2;
        for(int i=2; i<n+1; ++i) {
            dp[i] = (dp[i-1] + dp[i-2])%M;
        }
        return (int) (dp[n]*dp[n]%M);
    }
}