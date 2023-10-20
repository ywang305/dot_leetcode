/*
 * @lc app=leetcode id=828 lang=java
 *
 * [828] Count Unique Characters of All Substrings of a Given String
 */

// @lc code=start
class Solution {
    public int uniqueLetterString(String s) {
        List<List<Integer>> map = new ArrayList<>();
        for(int i=0; i<26; ++i) map.add(new ArrayList<>());
        
        int len = s.length();
        for(int i=0; i<len; ++i) {
            map.get(s.charAt(i)-'A').add(i);
        }
        
        int contribution = 0;
        for(int i=0; i<26; ++i) {
            var list = map.get(i);
            list.add(0, -1); // add a dummy left boundary as helper
            list.add(len);   // ādd a dummy right boundary as helper
            var size = list.size();
            for(int j=1; j<size-1; ++j) {
                var cur = list.get(j);
                var pre = list.get(j-1);
                var next = list.get(j+1);
                contribution += (cur-pre) * (next-cur); // key：乘法组合
            }
        }
        return contribution;
    }
}
// @lc code=end

