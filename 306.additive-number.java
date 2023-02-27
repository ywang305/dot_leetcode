/*
 * @lc app=leetcode id=306 lang=java
 *
 * [306] Additive Number
 */

// @lc code=start
class Solution {
    String num;
    public boolean isAdditiveNumber(String num) {
        this.num = num;
        for(int i=0; i<num.length()-2; ++i) {
            for(int j=i+1; j<num.length()-1; ++j) {
                String first = num.substring(0,  i+1);
                String second = num.substring(i+1, j+1);
                if(dfs(j+1, first, second)) return true;
            }
        }
        return false;
    }

    boolean dfs(int start, String prepre, String pre) {
        if(start>=num.length()) return true;  // We made it to the end!
        if(prepre.length()>1 && prepre.startsWith("0") || (pre.length()>1 && pre.startsWith("0"))) return false;  // No leading '0': 1, 2, 03 or 1, 02, 3 is invalid.

        Long curNum = Long.valueOf(prepre) + Long.valueOf(pre);  // overflow if Integer, then Long 
        String cur = curNum.toString();
        if(num.startsWith(cur.toString(), start) && dfs(start+cur.length(), pre, cur)) {
            return true;
        }
        return false;
    }
}
// @lc code=end

