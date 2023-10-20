/*
 * @lc app=leetcode id=79 lang=javascript
 *
 * [79] Word Search
 */

// @lc code=start
/**
 * @param {character[][]} board
 * @param {string} word
 * @return {boolean}
 */
var exist = function (board, word) {
  const m = board.length;
  const n = board[0].length;
  const visited = Array.from({ length: m }, () => []);

  const dfs = (start, i, j) => {
    if (start === word.length) return true;
    if (i < 0 || j < 0 || i >= m || j >= n || visited[i][j]) return false;

    visited[i][j] = true;
    const res =
      board[i][j] === word[start] &&
      (dfs(start + 1, i - 1, j) ||
        dfs(start + 1, i + 1, j) ||
        dfs(start + 1, i, j - 1) ||
        dfs(start + 1, i, j + 1));
    visited[i][j] = false;
    return res;
  };

  for (let i = 0; i < m; ++i) {
    for (let j = 0; j < n; ++j) {
      if (dfs(0, i, j)) return true;
    }
  }
  return false;
};
// @lc code=end
