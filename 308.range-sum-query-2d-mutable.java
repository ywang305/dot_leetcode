/**
Input
["NumMatrix", "sumRegion", "update", "sumRegion"]
[[[[3, 0, 1, 4, 2], [5, 6, 3, 2, 1], [1, 2, 0, 1, 5], [4, 1, 0, 1, 7], [1, 0, 3, 0, 5]]], [2, 1, 4, 3], [3, 2, 2], [2, 1, 4, 3]]
Output
[null, 8, null, 10]

Explanation
NumMatrix numMatrix = new NumMatrix([[3, 0, 1, 4, 2], [5, 6, 3, 2, 1], [1, 2, 0, 1, 5], [4, 1, 0, 1, 7], [1, 0, 3, 0, 5]]);
numMatrix.sumRegion(2, 1, 4, 3); // return 8 (i.e. sum of the left red rectangle)
numMatrix.update(3, 2, 2);       // matrix changes from left image to right image
numMatrix.sumRegion(2, 1, 4, 3); // return 10 (i.e. sum of the right red rectangle)
 */

 
class NumMatrix {
    STNode root;
    public NumMatrix(int[][] matrix) {
        int m = matrix.length, n = matrix[0].length;
        root = new STNode(0, m-1, 0, n-1);
        for(int i=0; i<m; ++i)
            for(int j=0; j<n; ++j) root.update(i,j, matrix[i][j]);
        
    }
    
    public void update(int row, int col, int val) {
        this.root.update(row, col, val);
    }
    
    public int sumRegion(int row1, int col1, int row2, int col2) {
        return this.root.query(row1, col1, row2, col2);
    }

    class STNode {
        STNode nw, ne, sw, se;  // 4 quadrants: northwest, northeast, southwest, southeast
        int xstart, xend, ystart, yend;
        int val;

        public STNode(int xs, int xe, int ys, int ye) {
            xstart = xs;
            xend = xe;
            ystart = ys;
            yend = ye;
        }

        void update(int x, int y, int val) {
            if(x==xstart && xstart==xend && y==ystart && ystart==yend) {
                this.val = val;
                return;
            }
            int xmid = (xstart+xend) >> 1, ymid = (ystart+yend) >> 1;
            if(nw==null) nw = new STNode(xstart, xmid, ystart, ymid);
            if(ne==null) ne = new STNode(xstart, xmid, ymid+1, yend);
            if(sw==null) sw = new STNode(xmid+1, xend, ystart, ymid);
            if(se==null) se = new STNode(xmid+1, xend, ymid+1, yend);

            if(x<=xmid && y<=ymid) nw.update(x, y, val);
            else if(x<=xmid && y>ymid) ne.update(x, y, val);
            else if(x>xmid && y<=ymid) sw.update(x, y, val);
            else se.update(x, y, val);
            this.val = nw.val+ne.val+sw.val+se.val;
        }

        int query(int xs, int ys, int xe, int ye) {
            if(xs<=xstart && xe>=xend && ys<=ystart && ye>=yend) return val;

            int res = 0, xmid = (xstart+xend) >> 1, ymid = (ystart+yend) >> 1;
            if(xs<=xmid && ys<=ymid) res += nw.query(xs, ys, Math.min(xe, xmid), Math.min(ye, ymid));
            if(xs<=xmid && ye>ymid) res += ne.query(xs, Math.max(ys, ymid+1), Math.min(xe, xmid), ye);
            if(xe>xmid && ys<=ymid) res += sw.query(Math.max(xs, xmid+1), ys, xe, Math.min(ye, ymid));
            if(xe>xmid && ye>ymid) res += se.query(Math.max(xs, xmid+1), Math.max(ys, ymid+1), xe, ye);
            return res;
        }
    }
}

/**
 * Your NumMatrix object will be instantiated and called as such:
 * NumMatrix obj = new NumMatrix(matrix);
 * obj.update(row,col,val);
 * int param_2 = obj.sumRegion(row1,col1,row2,col2);
 */