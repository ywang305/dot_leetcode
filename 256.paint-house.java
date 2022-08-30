/**
There is a row of n houses, where each house can be painted one of three colors: red, blue, or green. The cost of painting each house with a certain color is different. You have to paint all the houses such that no two adjacent houses have the same color.

The cost of painting each house with a certain color is represented by an n x 3 cost matrix costs.

For example, costs[0][0] is the cost of painting house 0 with the color red; costs[1][2] is the cost of painting house 1 with color green, and so on...
Return the minimum cost to paint all houses.

 

Example 1:

Input: costs = [[17,2,17],[16,16,5],[14,3,19]]
Output: 10
Explanation: Paint house 0 into blue, paint house 1 into green, paint house 2 into blue.
Minimum cost: 2 + 5 + 3 = 10.
Example 2:

Input: costs = [[7,6,2]]
Output: 2
 */

class Solution {
    public int minCost(int[][] costs) {
        var n = costs.length;
        for(int i=1; i<n; ++i) {
            for(int j=0; j<3; ++j) {
                costs[i][j] += Math.min(costs[i-1][(j+1)%3], costs[i-1][(j+2)%3]);
            }
        }
        return Math.min(Math.min(costs[n-1][0], costs[n-1][1]), costs[n-1][2]);
    }
}