/*
 * @lc app=leetcode id=93 lang=java
 *
 * [93] Restore IP Addresses
 */

// @lc code=start
class Solution {
    List<String> res = new ArrayList<>();
    List<String> path = new ArrayList<>();
    
    public List<String> restoreIpAddresses(String s) {
        dfs(s, 0);
        return  res;
    }
    
    public void dfs(String s, int startIndex) {
        if(path.size() == 4){
            res.add(String.join(".", path));
            return;
        }
        
        for(int i = startIndex; i < s.length(); i++) {
            if(s.length()-1-i > 3*(3-path.size())) continue; // 剩余的字符串长度不足以构成一个IP地址
            var substr = s.substring(startIndex, i + 1);
            if(!isValid(substr)) break;
            path.add(substr);
            dfs(s, i + 1);
            path.remove(path.size() - 1);
        }
    }
    
    public boolean isValid(String s) {
        if(s.charAt(0) == '0' && s.length() > 1)    return false;
        if(s.length()>3 || Integer.parseInt(s)>255) return false;
        return true;
    }
}
// @lc code=end

