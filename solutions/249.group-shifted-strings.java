/**
We can shift a string by shifting each of its letters to its successive letter.

For example, "abc" can be shifted to be "bcd".
We can keep shifting the string to form a sequence.

For example, we can keep shifting "abc" to form the sequence: "abc" -> "bcd" -> ... -> "xyz".
Given an array of strings strings, group all strings[i] that belong to the same shifting sequence. You may return the answer in any order.

 

Example 1:

Input: strings = ["abc","bcd","acef","xyz","az","ba","a","z"]
Output: [["acef"],["a","z"],["abc","bcd","xyz"],["az","ba"]]


Example 2:

Input: strings = ["a"]
Output: [["a"]]
*/

class Solution {
    public List<List<String>> groupStrings(String[] strings) {
        int n = strings.length;
        Map<String, List<String>> map = new HashMap<>();
        for(String str : strings) {
            String code = getHash(str);
            List<String> list = map.computeIfAbsent(code, (k)->new ArrayList<String>());
            list.add(str);
        }
        return new ArrayList<List<String>>(map.values());
    }
    
    String getHash(String s) {
        char[] chars = s.toCharArray();
        int shift = chars[0];
        for(int i=0; i<chars.length; ++i) {
            chars[i] = (char) ((chars[i]-shift+26)%26 + 'a');
        }
        return new String(chars);
    }
}