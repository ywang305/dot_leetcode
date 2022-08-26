/**
Given an integer n, return all the strobogrammatic numbers that are of length n. You may return the answer in any order.

A strobogrammatic number is a number that looks the same when rotated 180 degrees (looked at upside down).

 

Example 1:

Input: n = 2
Output: ["11","69","88","96"]
Example 2:

Input: n = 1
Output: ["0","1","8"]

 */

class Solution {
    public char[][] reversiblePairs = {
        {'0', '0'}, {'1', '1'}, 
        {'6', '9'}, {'8', '8'}, {'9', '6'}
    };
    
    public List<String> findStrobogrammatic(int n, int finalN) {
        if(n==0) return List.of("");
        if(n==1) return List.of("0","1","8");
        
        List<String> subAns = findStrobogrammatic(n-2, finalN);
        List<String> ans = new ArrayList<>();
        for(char[] pair : reversiblePairs) {
            char first = pair[0], last = pair[1];
            if(first=='0' && n==finalN) continue; // key， edge case， 0 is invalid to add if last step
            for(String num : subAns) {
                ans.add( first + num + last );
            }
        }
        return ans;
    }
    
    public List<String> findStrobogrammatic(int n) {
        return findStrobogrammatic(n, n);
    }
}