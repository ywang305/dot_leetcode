/*
 * @lc app=leetcode id=233 lang=java
 *
 * [233] Number of Digit One
 */

// @lc code=start
class Solution {
    public int countDigitOne(int n) {
        String s = String.valueOf(n);
        int len = s.length();
        if(len==1) return n>0 ? 1 : 0;
        
        int[] left = new int[len], right = new int[len];
        
        // edge case
        right[0] = Integer.valueOf(s.substring(1));
        left[len-1] = Integer.valueOf(s.substring(0, len-1));
        
        for(int i=1; i<len-1; ++i) {
            left[i] = Integer.valueOf(s.substring(0, i));
            right[i] = Integer.valueOf(s.substring(i+1));
        }
        
        int ans = 0;
        for(int i=0; i<len; ++i) {
            int leftN = left[i], rightN = right[i];
            int ni = s.charAt(i)-'0'; 
            // case： 左边数字 [0, leftN), -> 左边贡献值 leftN
            ans += leftN * Math.pow(10, (len-i-1));
            
            // case: 左边数字 == leftN, 左边贡献值 1
            if(ni==1) {
                ans += 1*(rightN+1);
            } else if(ni>1) {
                ans += 1*Math.pow(10, (len-i-1));
            }
        }
        return ans;
    }
}
// @lc code=end

