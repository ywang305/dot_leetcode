/**
Given two strings low and high that represent two integers low and high where low <= high, return the number of strobogrammatic numbers in the range [low, high].

A strobogrammatic number is a number that looks the same when rotated 180 degrees (looked at upside down).

 

Example 1:

Input: low = "50", high = "100"
Output: 3
Example 2:

Input: low = "0", high = "0"
Output: 1
*/

class Solution {
    public int strobogrammaticInRange(String low, String high) {
        long lowNum = Long.valueOf(low);
        long highNum = Long.valueOf(high);
        int lowN = low.length();
        int highN = high.length();
        int count = 0;
        for(int i = lowN; i<=highN; ++i) {
            List<String> list = findStrobogrammatic(i, i);
            for(String found : list) {
                long num = Long.valueOf(found);
                if(lowNum <= num && num <= highNum) ++count;
            }
        }
        return count;
    }
    
    public List<String> findStrobogrammatic(int n, int finalN) {
        if(n==0) return List.of("");
        if(n==1) return List.of("0","1","8");
        
        List<String> subList = findStrobogrammatic(n-2, finalN);
        List<String> list = new ArrayList<>();
        for(char[] pair : reversiblePairs) {
            char first = pair[0], last = pair[1];
            if(first=='0' && n==finalN) continue;
            for(String num : subList) {
                list.add( first + num + last );
            }
        }
        return list;
    }
        
    char[][] reversiblePairs = {
        {'0','0'}, {'1','1'}, {'8','8'},
        {'6','9'}, {'9','6'}
    };
}