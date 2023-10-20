/*
 * @lc app=leetcode id=60 lang=javascript
 *
 * [60] Permutation Sequence
 */

// @lc code=start
/**
 * @param {number} n
 * @param {number} k
 * @return {string}
 */
var getPermutation = function (n, k) {
  const list = Array.from({ length: n }, (_, i) => String(i + 1));

  let counter = 0;
  const DFS = (arr) => {
    if (arr.length === 0) {
      if (++counter === k) return "";
      return;
    }
    for (let i = 0; i < arr.length; ++i) {
      const subStr = DFS(arr.filter((_, idx) => idx !== i));
      if (subStr !== undefined) {
        return arr[i] + subStr;
      }
    }
  };

  return DFS(list);
};
// @lc code=end

getPermutation(3, 5);
