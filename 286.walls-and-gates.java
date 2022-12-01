class Solution {
    public void wallsAndGates(int[][] rooms) {
        this.rooms = rooms;
        this.m = rooms.length;
        this.n = rooms[0].length;

        List<Point> gates = new ArrayList<>();

        // 先找出所有目标
        for(int i=0; i<m; ++i) {
            for(int j=0; j<n; ++j) {
                if(rooms[i][j] == 0) {
                    gates.add(new Point(i, j));
                }
            }
        }

        Queue<Point> q = new ArrayDeque<>();
        // 多源BFS
        for(Point g : gates) {
            q.offer(g);
            int step = 0;
            while(!q.isEmpty()) {
                int size = q.size();
                for(int i=0; i<size; ++i) {
                    Point point = q.poll();
                    int x = point.x();
                    int y = point.y();
                    if(isEmptyCell(x-1, y) && step+1 < rooms[x-1][y]) {
                        rooms[x-1][y] = step+1;
                        q.offer(new Point(x-1, y));
                    }
                    if(isEmptyCell(x+1, y) && step+1 < rooms[x+1][y]) {
                        rooms[x+1][y] = step+1;
                        q.offer(new Point(x+1, y));
                    }
                    if(isEmptyCell(x, y-1) && step+1 < rooms[x][y-1]) {
                        rooms[x][y-1] = step+1;
                        q.offer(new Point(x, y-1));
                    }
                    if(isEmptyCell(x, y+1) && step+1 < rooms[x][y+1]) {
                        rooms[x][y+1] = step+1;
                        q.offer(new Point(x, y+1));
                    }
                }
                step+=1;
            }
        }
    }

    int[][] rooms;
    int m;
    int n;

    record Point(int x, int y){ }

    boolean isEmptyCell(int x, int y) {
        return x>=0 && x<m && y>=0 && y<n && rooms[x][y] > 0;
    }
}