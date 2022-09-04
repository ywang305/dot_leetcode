/**
You have a graph of n nodes labeled from 0 to n - 1. 
You are given an integer n and a list of edges where edges[i] = [ai, bi] indicates that 
there is an undirected edge between nodes ai and bi in the graph.

Return true if the edges of the given graph make up a valid tree, and false otherwise.

 
Example 1:


Input: n = 5, edges = [[0,1],[0,2],[0,3],[1,4]]
Output: true
Example 2:


Input: n = 5, edges = [[0,1],[1,2],[2,3],[1,3],[1,4]]
Output: false
 */

// DFS
class Solution1 {
    public boolean validTree(int n, int[][] edges) {
        visited = new boolean[n];
        List<Integer>[] adjList = new List[n];
        for(int i=0; i<n; ++i) {
            adjList[i] = new ArrayList<>();
        }
        
        for(int[] edge : edges) {
            int v1 = edge[0], v2 = edge[1];
            adjList[v1].add(v2);
            adjList[v2].add(v1);
        }
        
        if(!dfs(-1, 0, adjList)) return false;
        for(var v : visited) {
            if(!v) return false;
        }
        return true;
    }
    
    boolean dfs(int from, int cur, List<Integer>[] adjList) {
        if(visited[cur]) return false;
        visited[cur] = true;
        for(var adj : adjList[cur]) {
            if(adj==from) continue;
            if(!dfs(cur, adj, adjList)) return false;
        }
        return true;
    }
    
    boolean[] visited;
}

// UninoFind
class Solution2 {
    public boolean validTree(int n, int[][] edges) {        
        // Condition 1: The graph must contain n - 1 edges.
        if(edges.length != n-1) return false;
        
        // Condition 2: The graph must contain a single connected component.
        var ufo = new UnionFind<Integer>();
        for(int[] edge : edges) {
            int a = edge[0], b = edge[1];
            ufo.union(a,b);
        }
        
        var root = ufo.find(0);
        for(int i=1; i<n; ++i) {
            if(root != ufo.find(i)) return false;
        }
        return true;
        
    }
    
    class UnionFind<T> {
        Map<T,T> root = new HashMap<>();
        
        void union(T x, T y) {
            var rootX = this.find(x);
            var rootY = this.find(y);
            if(rootX == rootY) return;
            this.root.put(rootX, rootY);
        }
        
        T find(T x) {
            if(!this.root.containsKey(x)) this.root.put(x, x);
            var parent = this.root.get(x);
            return parent == x ? x : this.find(parent);
        }
    }
}
