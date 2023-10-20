/**

You are painting a fence of n posts with k different colors. You must paint the posts following these rules:

Every post must be painted exactly one color.
There cannot be three or more consecutive posts with the same color.
Given the two integers n and k, return the number of ways you can paint the fence.

 

Example 1:


Input: n = 3, k = 2
Output: 6
Explanation: All the possibilities are shown.
Note that painting all the posts red or all the posts green is invalid because there cannot be three posts in a row with the same color.


https://www.algoninjutsu.com/post/216/
 */

class Solution {
    private Map<Integer, Integer> memo = new HashMap<>();

    public int numWays(int n, int k) {
        if(n==1) return k;
        if(n==2) return k*k;
        if(memo.containsKey(n)) return memo.get(n);

        memo.put(n, (k-1) * (numWays(n-1, k) + numWays(n-2, k)));
        return memo.get(n);
    }
} 