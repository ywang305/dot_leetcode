/**
Given a string s, return all the palindromic permutations (without duplicates) of it.

You may return the answer in any order. If s has no palindromic permutation, return an empty list.

 

Example 1:

Input: s = "aabb"
Output: ["abba","baab"]
Example 2:

Input: s = "abc"
Output: []

 */

class Solution {
    Set<String> set = new HashSet<>();
    
    public List<String> generatePalindromes(String s) {
        int[] counts = new int[26];
        for(char c : s.toCharArray()) {
            counts[c-'a']++;
        }
        
        Character oddChar = null;
        StringBuilder sb = new StringBuilder(); // collect the half of palindrome str
        for(int i=0; i<26; ++i) {
            if(counts[i]%2==1) {
                if(oddChar!=null) return List.of(); 
                oddChar = (char)('a'+i);
            }
            for(int j=0; j<counts[i]/2; ++j) sb.append((char)('a'+i));
        }
        
        permute(sb.toString().toCharArray(), 0, oddChar);
        
        return new ArrayList<>(this.set);
    }
    
    void permute(char[] cs, int start, Character oddChar) {
        if(start>=cs.length) {
            String half1 = new String(cs);
            String half2 = new StringBuilder(half1).reverse().toString();
            set.add(half1 + (oddChar!=null? oddChar : "") + half2);
            return;
        }
        for(int i=start; i<cs.length; ++i) {
            if(i>start && cs[i]==cs[start]) continue; // 可以避免次行去重，因为不足以保证不出现重复解，所以最终需要用HashSet来去重复

            swap(cs, start, i);
            permute(cs, start+1, oddChar);
            swap(cs, start, i);
        }
    }
    
    void swap(char[] cs, int i, int j) {
        char temp = cs[i];
        cs[i] = cs[j];
        cs[j] = temp;
    }
}
