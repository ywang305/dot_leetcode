/*
 * @lc app=leetcode id=165 lang=javascript
 *
 * [165] Compare Version Numbers
 */

// @lc code=start
/**
 * @param {string} version1
 * @param {string} version2
 * @return {number}
 */
var compareVersion = function (version1, version2) {
  const arr1 = version1.split(".");
  const arr2 = version2.split(".");
  let i = 0;
  while (i < arr1.length && i < arr2.length) {
    const n1 = Number(arr1[i]),
      n2 = Number(arr2[i]);
    if (n1 < n2) {
      return -1;
    } else if (n1 > n2) {
      return 1;
    }
    ++i;
  }

  if (i === arr1.length) {
    return arr2.slice(i).some((v) => Number(v) > 0) ? -1 : 0;
  } else {
    return arr1.slice(i).some((v) => Number(v) > 0) ? 1 : 0;
  }
};
// @lc code=end
