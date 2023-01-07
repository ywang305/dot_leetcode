/**
Example 1:

Input: pattern = "abab", s = "redblueredblue"
Output: true
Explanation: One possible mapping is as follows:
'a' -> "red"
'b' -> "blue"
 */
class Solution {
    public boolean wordPatternMatch(String pattern, String s) {
        if(pattern.isEmpty()) return s.isEmpty();

        Character c = pattern.charAt(0);
        if(map.containsKey(c)) {
            String memoStr = map.get(c);
            return s.startsWith(memoStr) ? // 注意这里
              wordPatternMatch(pattern.substring(1), s.substring(memoStr.length())) : false;
        }

        for(int i=1; i<=s.length(); ++i) {
            String substr = s.substring(0, i);
            if(map.containsValue(substr)) continue; // substr已经被映射过，再出现跳过，不容易想到
            map.put(c, substr);
            if(wordPatternMatch(pattern.substring(1), s.substring(i))) return true;
            map.remove(c);
        }
        return false;
    }

    Map<Character,String> map = new HashMap<>();
}