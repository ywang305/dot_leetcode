class Solution {
    public int minTotalDistance(int[][] grid) {
        int m = grid.length, n = grid[0].length;
        List<Integer> row = new ArrayList<>();
        List<Integer> col = new ArrayList<>();
        for(int i=0; i<m; ++i) {
            for(int j=0; j<n; ++j) {
                if(grid[i][j]==1) {
                    row.add(i);
                    col.add(j);
                }
            }
        }
        return minDistance(row) + minDistance(col);
    }

    private int minDistance(List<Integer> list) {
        list.sort(Integer::compareTo);
        int i=0, j=list.size()-1;
        int ans = 0;
        while(i<j) ans += list.get(j--) - list.get(i++);
        return ans;
    }
}
