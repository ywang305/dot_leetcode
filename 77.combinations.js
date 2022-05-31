/*
 * @lc app=leetcode id=77 lang=javascript
 *
 * [77] Combinations
 */

// @lc code=start
/**
 * @param {number} n
 * @param {number} k
 * @return {number[][]}
 */
var combine = function (n, k) {
  const arr = Array.from({ length: n }, (_, i) => i + 1);

  const res = [];
  const cur = [];
  const dfs = (start, k) => {
    if (!k) {
      res.push(cur.slice());
      return;
    }
    for (let i = start; i < arr.length; ++i) {
      cur.push(arr[i]);
      dfs(i + 1, k - 1);
      cur.pop(arr[i]);
    }
  };

  // dfs(0, k);
  // return res;

  const dfs2 = (list, k) => {
    if (!k) {
      return [[]];
    }
    const res = [];
    for (let i = 0; i < list.length; i++) {
      const cur = list[i];
      const next = list.slice(i + 1);
      dfs2(next, k - 1).forEach((sub) => {
        res.push([cur, ...sub]);
      });
    }
    return res;
  };

  return dfs2(arr, k);
};
// @lc code=end
