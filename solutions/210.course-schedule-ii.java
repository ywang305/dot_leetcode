/*
 * @lc app=leetcode id=210 lang=java
 *
 * [210] Course Schedule II
 */

// @lc code=start
class Solution {
    public int[] findOrder(int numCourses, int[][] prerequisites) {
        List<Integer>[] adjList = new List[numCourses];
        for(int i=0; i<numCourses; ++i) {
            adjList[i] = new ArrayList<>();
        }
        int[] indegrees = new int[numCourses];
        
        for(var prereq : prerequisites) {
            var pre = prereq[1];
            var cur = prereq[0];
            adjList[pre].add(cur);
            indegrees[cur]++;
        }
        
        Queue<Integer> q = new ArrayDeque<>();
        for(int i=0; i<numCourses; ++i) {
            if(indegrees[i]==0) {
                q.offer(i);
            }
        }
        List<Integer> order = new ArrayList<>();;
        while(!q.isEmpty()) {
            var id = q.poll();
            order.add(id);
            var list = adjList[id];
            list.forEach(nid->{
                indegrees[nid]--;
                if(indegrees[nid]==0) {
                    q.offer(nid);
                }
            });
        }
        
        if(order.size()!=numCourses) return new int[]{};
        
        return order.stream().mapToInt(i->i).toArray();
    }
}
// @lc code=end

