/*
 * @lc app=leetcode id=1926 lang=java
 *
 * [1926] Nearest Exit from Entrance in Maze
 */

// @lc code=start
class Solution {
    record Point(int x, int y, char[][] maze, int[] entrance) {
        public boolean isEmptyCell() {
            return x>=0 && x<maze.length && y>=0 && y<maze[0].length && maze[x][y]=='.';
        }
        public boolean isExitCell() {
            return isEmptyCell() && !(x==entrance[0] && y==entrance[1]) && (x-1<0 || x+1==maze.length || y-1<0 || y+1==maze[0].length);
        }
    }

    public int nearestExit(char[][] maze, int[] entrance) {
        int m = maze.length, n = maze[0].length;
        var visited = new boolean[m][n];

        Queue<Point> q = new ArrayDeque<>();
        q.offer(new Point(entrance[0], entrance[1], maze, entrance));
        visited[entrance[0]][entrance[1]] = true;

        int step = 0;
        while(!q.isEmpty()) {
            int size = q.size();
            for(int i=0; i<size; ++i) {
                Point cell = q.poll();
                int x = cell.x();
                int y = cell.y();
                if(cell.isExitCell()) return step;

                var p1 = new Point(x-1, y, maze, entrance);
                var p2 = new Point(x+1, y, maze, entrance);
                var p3 = new Point(x, y-1, maze, entrance);
                var p4 = new Point(x, y+1, maze, entrance);

                Stream.of(p1,p2,p3,p4).filter(p->{
                    return p.isEmptyCell() && !visited[p.x()][p.y()];
                }).forEach(p->{
                    visited[p.x()][p.y()] = true;
                    q.offer(p);
                });
            }
            step++;
        }
        return -1;
    }
}
// @lc code=end

