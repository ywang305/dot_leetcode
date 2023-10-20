/*
 * @lc app=leetcode id=207 lang=java
 *
 * [207] Course Schedule
 */

// @lc code=start
class Solution {
    public boolean canFinish(int numCourses, int[][] prerequisites) {
        int[] indegrees = new int[numCourses];
        List<Integer>[] adjList = new List[numCourses];
        for(var i=0; i<adjList.length; ++i) adjList[i] = new ArrayList<>();
        for(var req : prerequisites) {
            int cur = req[0];
            int pre = req[1];
            if(adjList[pre] == null) adjList[pre] = new ArrayList<Integer>();
            adjList[pre].add(cur);
            indegrees[cur]++;
        }
        Queue<Integer> q = new LinkedList<>();
        for(int i=0; i<numCourses; ++i) {
            if(indegrees[i]==0) {
                q.offer(i);
                indegrees[i] = -1;
            }  
        }
        while(!q.isEmpty()) {
            var cur = q.poll();
            adjList[cur].forEach(next->{
                indegrees[next]--;
                if(indegrees[next]==0) {
                    q.offer(next);
                    indegrees[next] = -1;
                }
            });
        }
        return Arrays.stream(indegrees).allMatch(i->i<0);
    }
}
// @lc code=end

