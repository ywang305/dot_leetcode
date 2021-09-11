/*
 * @lc app=leetcode id=455 lang=javascript
 *
 * [455] Assign Cookies
 */

// @lc code=start
/**
 * @param {number[]} g
 * @param {number[]} s
 * @return {number}
 */
var findContentChildren = function (g, s) {
  const asc = (a, b) => a - b;
  g.sort(asc);
  s.sort(asc);

  let res = 0;
  let i = 0,
    j = 0;
  while (i < g.length && j < s.length) {
    if (g[i] <= s[j++]) {
      ++i;
      res++;
    }
  }
  return res;
};
// @lc code=end
