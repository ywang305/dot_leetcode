/*
 * @lc app=leetcode id=289 lang=java
 *
 * [289] Game of Life
 */

// @lc code=start
class Solution {
    public void gameOfLife(int[][] board) {
        int m = board.length, n = board[0].length;
        for(int i=0; i<m; ++i) {
            for(int j=0; j<n; ++j) {
                if(board[i][j]%10==1) { // 向周围辐射影响，巧妙利用个位和十位区分自己和周边的复合状态
                    if(i-1>=0) board[i-1][j]+=10;
                    if(i+1<m) board[i+1][j]+=10;
                    if(j-1>=0) board[i][j-1]+=10;
                    if(j+1<n) board[i][j+1]+=10;
                    if(i-1>=0 && j-1>=0) board[i-1][j-1]+=10;
                    if(i-1>=0 && j+1<n) board[i-1][j+1]+=10;
                    if(i+1<m && j-1>=0) board[i+1][j-1]+=10;
                    if(i+1<m && j+1<n) board[i+1][j+1]+=10;
                }
            }
        }
        for(int i=0; i<m; ++i) {
            for(int j=0; j<n; ++j) {
                int self = board[i][j]%10;
                int surround = board[i][j]/10;
                board[i][j] = self;
                if(self==1) {
                    if(surround<2) board[i][j] = 0;
                    if(surround>3) board[i][j] = 0;
                } else if(self==0 && surround==3){
                    board[i][j] = 1;
                }
            }
        }
    }
}
// @lc code=end

