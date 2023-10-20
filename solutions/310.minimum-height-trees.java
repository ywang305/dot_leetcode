/*
 * @lc app=leetcode id=310 lang=java
 *
 * [310] Minimum Height Trees
 */

// @lc code=start
class Solution {
    public List<Integer> findMinHeightTrees(int n, int[][] edges) {
        if(n==1) return List.of(0);

        List<List<Integer>> adjList = new ArrayList<>();
        int[] inDegrees = new int[n];
        for(int i=0; i<n; ++i)  adjList.add(new ArrayList<>());

        for(var e: edges) {
            adjList.get(e[0]).add(e[1]);
            adjList.get(e[1]).add(e[0]);
            inDegrees[e[0]]++;
            inDegrees[e[1]]++;
        }
        Queue<Integer> queue = new LinkedList<>();
        for(int i=0; i<n; ++i) {
            if(inDegrees[i]==1) queue.offer(i);
        }

        List<Integer> ans = List.of();
        while(!queue.isEmpty()) { // remove leafs like a ripple from outter to inner, the innest layer is the ans!
            ans = new ArrayList<>(queue);
            for(int i=0; i<ans.size(); ++i) {
                int node = queue.poll();
                inDegrees[node]--;
                for(int neighbor : adjList.get(node)) {
                    adjList.get(neighbor).removeIf(e -> e==node);
                    inDegrees[neighbor]--;
                    if(inDegrees[neighbor]==1) queue.offer(neighbor);
                }
            }
        }
        return ans;
    }

}
// @lc code=end

