/*
 * @lc app=leetcode id=22 lang=javascript
 *
 * [22] Generate Parentheses
 */

// @lc code=start
/**
 * @param {number} n
 * @return {string[]}
 */
var generateParenthesis = function (n) {
  let res = [];
  // 这个比Grandyang 方法好多了
  const dfs = (path, left, right) => {
    if (left > n || left < right) return;
    if (left + right === 2 * n) {
      res.push(path);
    }
    dfs(path + "(", left + 1, right);
    dfs(path + ")", left, right + 1);
  };
  dfs("", 0, 0);
  return res;
};
// @lc code=end
