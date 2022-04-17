/*
 * @lc app=leetcode id=200 lang=javascript
 *
 * [200] Number of Islands
 */

// @lc code=start
/**
 * @param {character[][]} grid
 * @return {number}
 */
var numIslands = function (grid) {
  function UnionFind() {
    this.find = (x) => {
      if (undefined === this[x]) this[x] = x;
      return this[x] === x ? x : this.find(this[x]);
    };
    this.union = (x, y) => {
      const rootX = this.find(x);
      const rootY = this.find(y);
      if (rootX === rootY) return;
      this[rootX] = rootY;
    };
  }

  const ufo = new UnionFind();
  const m = grid.length,
    n = grid[0].length;

  for (let i = 0; i < m; i++) {
    for (let j = 0; j < n; j++) {
      if (grid[i][j] === "1") {
        ufo.find(i * m + j);
        if (grid[i - 1]?.[j] === "1") ufo.union(i * m + j, (i - 1) * m + j);
        if (grid[i][j - 1] === "1") ufo.union(i * m + j, i * m + j - 1);
      }
    }
  }

  return Object.keys(ufo).filter((key) => String(ufo[key]) === key).length;
};
// @lc code=end
