/*
 * @lc app=leetcode id=304 lang=java
 *
 * [304] Range Sum Query 2D - Immutable
 */

// @lc code=start
class NumMatrix {

    public NumMatrix(int[][] matrix) {
        nt m = matrix.length, n = matrix[0].length;
        this.presum = new int[m+1][n+1];
        for(int i=0; i<m; ++i) {
            for(int j=0; j<n; ++j) {
                presum[i+1][j+1] = matrix[i][j] + presum[i][j+1] + presum[i+1][j] - presum[i][j]; 
            }
        }
    }
    
    public int sumRegion(int row1, int col1, int row2, int col2) {
        return presum[row2+1][col2+1] - presum[row1][col2+1] - presum[row2+1][col1] + presum[row1][col1];
    }

    int[][] presum;
}

/**
 * Your NumMatrix object will be instantiated and called as such:
 * NumMatrix obj = new NumMatrix(matrix);
 * int param_1 = obj.sumRegion(row1,col1,row2,col2);
 */
// @lc code=end

