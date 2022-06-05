/*
 * @lc app=leetcode id=684 lang=javascript
 *
 * [684] Redundant Connection
 */

// @lc code=start
/**
 * @param {number[][]} edges
 * @return {number[]}
 */
var findRedundantConnection = function (edges) {
  /** DFS */

  const graph = [],
    dfs = (s, t, visited = []) => {
      if (s === t) return true; // cycle
      if (visited[s] || !graph[s]) return false;
      visited[s] = true;
      for (const nei of graph[s]) {
        if (dfs(nei, t, visited)) return true;
      }
    };
  for (const [s, t] of edges) {
    if (dfs(s, t)) return [s, t];
    if (!graph[s]) graph[s] = [];
    if (!graph[t]) graph[t] = [];
    graph[s].push(t);
    graph[t].push(s);
  }

  /** disjoin set **/

  class UnionFind {
    find(x) {
      if (this[x] === undefined) this[x] = x;
      return this[x] === x ? x : this.find(this[x]);
    }
    union(x, y) {
      const rX = this.find(x);
      const rY = this.find(y);
      if (rX === rY) return;
      this[rY] = rX;
    }
  }
  const ufo = new UnionFind();
  for (const [s, t] of edges) {
    if (ufo.find(s) === ufo.find(t)) return [s, t];
    ufo.union(s, t);
  }

  /** topology */

  const adjList = [];
  for (const [s, t] of edges) {
    if (!adjList[s]) adjList[s] = { indeg: 0, neighbors: [] };
    if (!adjList[t]) adjList[t] = { indeg: 0, neighbors: [] };
    adjList[s].indeg++;
    adjList[s].neighbors.push(t);
    adjList[t].indeg++;
    adjList[t].neighbors.push(s);
  }
  let queue = [];
  adjList.forEach((v, i) => v.indeg === 1 && queue.push(i));
  while (queue.length) {
    const qcopy = queue.slice();
    queue = [];
    qcopy.forEach((id) => {
      adjList[id].indeg--;
      adjList[id].neighbors.forEach((nid) => {
        adjList[nid].indeg--;
        if (adjList[nid].indeg === 1) queue.push(nid);
      });
    });
  }
  for (const [s, t] of edges.reverse()) {
    if (adjList[s].indeg >= 2 && adjList[t].indeg >= 2) return [s, t];
  }
};
// @lc code=end
