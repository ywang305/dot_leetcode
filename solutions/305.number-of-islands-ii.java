/**
You are given an empty 2D binary grid grid of size m x n. The grid represents a map where 0's represent water and 1's represent land. Initially, all the cells of grid are water cells (i.e., all the cells are 0's).

We may perform an add land operation which turns the water at position into a land. You are given an array positions where positions[i] = [ri, ci] is the position (ri, ci) at which we should operate the ith operation.

Return an array of integers answer where answer[i] is the number of islands after turning the cell (ri, ci) into a land.

An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.

 

Example 1:


Input: m = 3, n = 3, positions = [[0,0],[0,1],[1,2],[2,1]]
Output: [1,1,2,3]
Explanation:
Initially, the 2d grid is filled with water.
- Operation 1: addLand(0, 0) turns the water at grid[0][0] into a land. We have 1 island.
- Operation 2: addLand(0, 1) turns the water at grid[0][1] into a land. We still have 1 island.
- Operation 3: addLand(1, 2) turns the water at grid[1][2] into a land. We have 2 islands.
- Operation 4: addLand(2, 1) turns the water at grid[2][1] into a land. We have 3 islands.

 */

/**
Example 2:
m = 3, n =3, positions = [[0,1],[1,2],[2,1],[1,0],[0,2],[0,0],[1,1]]

ufo's state:   curKey -> (myRootKey)
____________________________
0->(4)     1->(2)     2->(0)

3->(0)     4->(4)     5->(2)

6          7->(4)     8
----------------------------

 */

class Solution {
    public List<Integer> numIslands2(int m, int n, int[][] positions) {
        var ufo = new UnionFind<Integer>();
        List<Integer> ans = new ArrayList<>();
        int[][] directions = { {-1,0}, {1,0}, {0,-1}, {0,1}};
        int cnt = 0;
        for(int[] coord : positions) {
            int x = coord[0], y = coord[1];
            int curKey = n*x+y;
            if(ufo.ROOT.containsKey(curKey)) {  // 防止positions含有重复的位置
                ans.add(cnt);
                continue;
            }
            ufo.union(curKey, curKey); //小心，先要自己和自己union形成一个component
            Set<Integer> neighborRoots = new HashSet<>();
            for(int[] dir : directions) {
                int nx = dir[0]+x, ny = dir[1]+y;
                int neiKey = n*nx+ny;
                if(nx>=0 && nx<m && ny>=0 && ny<n && ufo.ROOT.containsKey(neiKey)) {
                    Integer neiRoot = ufo.find(neiKey);
                    neighborRoots.add(neiRoot);
                }
            }
            if(neighborRoots.isEmpty()) {
                ans.add(++cnt);
            } else {
                neighborRoots.forEach(neiRoot -> ufo.union(neiRoot, curKey)); // curKey在第二个参数: 以curKey作为root
                cnt = cnt-neighborRoots.size()+1;
                ans.add( cnt );
            }
        }

        return ans;
    }

    class UnionFind<T> {
        Map<T,T> ROOT = new HashMap<>();

        void union(T x, T y) {
            T rootX = find(x);
            T rootY = find(y);
            if(rootX.equals(rootY)) return;
            ROOT.put(rootX, rootY);
        }

        T find(T x) {
            if(!ROOT.containsKey(x)) ROOT.put(x, x);
            T parent = ROOT.get(x);
            return parent.equals(x) ? x : find(parent);
        }
    }
}