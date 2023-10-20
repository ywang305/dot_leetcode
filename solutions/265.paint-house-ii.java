/**
There are a row of n houses, each house can be painted with one of the k colors. The cost of painting each house with a certain color is different. You have to paint all the houses such that no two adjacent houses have the same color.

The cost of painting each house with a certain color is represented by an n x k cost matrix costs.

For example, costs[0][0] is the cost of painting house 0 with color 0; costs[1][2] is the cost of painting house 1 with color 2, and so on...
Return the minimum cost to paint all houses.

 

Example 1:

Input: costs = [[1,5,3],[2,9,4]]
Output: 5
Explanation:
Paint house 0 into color 0, paint house 1 into color 2. Minimum cost: 1 + 4 = 5; 
Or paint house 0 into color 2, paint house 1 into color 0. Minimum cost: 3 + 2 = 5.

 */

class Solution {
    public int minCostII(int[][] costs) {
        int n = costs.length, k = costs[0].length;
        for(int i=1; i<n; ++i) {
            for(int cur=0; cur<k; ++cur) {
                int min = Integer.MAX_VALUE;
                for(int pre=0; pre<k; ++pre) {
                    if(pre==cur) continue;
                    min = Math.min(min, costs[i-1][pre]);
                }
                costs[i][cur] += min;
            }
        }
        
        return Arrays.stream(costs[n-1]).min().getAsInt();
    }
}