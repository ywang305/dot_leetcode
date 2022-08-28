/**
Medium

Numbers can be regarded as the product of their factors.

For example, 8 = 2 x 2 x 2 = 2 x 4.
Given an integer n, return all possible combinations of its factors. You may return the answer in any order.

Note that the factors should be in the range [2, n - 1].

 

Example 1:

Input: n = 1
Output: []
Example 2:

Input: n = 12
Output: [[2,6],[3,4],[2,2,3]]
Example 3:

Input: n = 37
Output: []

 */

class Solution {
    List<List<Integer>> result = new ArrayList<>();
    
    public List<List<Integer>> getFactors(int n) {
        dfs(2, n, new ArrayList<Integer>());
        return result;
    }
    
    void dfs(int low, int high, List<Integer> temp) {
        if(!temp.isEmpty()) {
            temp.add(high);
            result.add(new ArrayList<>(temp));
            temp.remove(temp.size()-1);
        }
        
        int last = (int) (Math.sqrt(high) + 1);
        for(int i=low; i<last; ++i) {
            if(high%i==0) {
                temp.add(i);
                dfs(i, high/i, temp);
                temp.remove(temp.size()-1);
            }
        }
    }
}