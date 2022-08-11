/*
 * @lc app=leetcode id=240 lang=java
 *
 * [240] Search a 2D Matrix II
 */

// @lc code=start
class Solution {
    public boolean searchMatrix(int[][] matrix, int target) {
        int m = matrix.length;
        int n = matrix[0].length;
        int r = 0, c = n-1;
        while(r < m && c >= 0) {
            if(matrix[r][c]<target) ++r;
            else if(matrix[r][c]>target) --c;
            else return true;
        }
        return false;
    }
}
// @lc code=end

