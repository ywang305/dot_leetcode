/*
 * @lc app=leetcode id=128 lang=javascript
 *
 * [128] Longest Consecutive Sequence
 */

// @lc code=start
/**
 * @param {number[]} nums
 * @return {number}
 */
var longestConsecutive = function (nums) {
  class UnionFind {
    union(x, y) {
      const rootX = this.find(x);
      const rootY = this.find(y);
      if (rootX === rootY) return;
      this[rootX] = rootY;
    }
    find(x) {
      if (undefined === this[x]) this[x] = x;
      return this[x] === x ? x : this.find(this[x]);
    }
  }

  const ufo = new UnionFind();
  nums.forEach((num) => {
    ufo.find(num);
    if (undefined !== ufo[num - 1]) ufo.union(num, num - 1);
    if (undefined !== ufo[num + 1]) ufo.union(num, num + 1);
  });

  const rootCount = new Map();
  new Set(nums).forEach((num) => {
    const root = ufo.find(num);
    rootCount.set(root, (rootCount.get(root) ?? 0) + 1);
  });
  return Math.max(...rootCount.values(), 0);
};
// @lc code=end
