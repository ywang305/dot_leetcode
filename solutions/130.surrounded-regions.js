/*
 * @lc app=leetcode id=130 lang=javascript
 *
 * [130] Surrounded Regions
 */

// @lc code=start
/**
 * @param {character[][]} board
 * @return {void} Do not return anything, modify board in-place instead.
 */
var solve = function (board) {
  const m = board.length,
    n = board[0].length;

  const DFS = (i, j) => {
    if ([undefined, "X", "+"].includes(board?.[i]?.[j])) return;
    board[i][j] = "+";
    DFS(i - 1, j);
    DFS(i + 1, j);
    DFS(i, j - 1);
    DFS(i, j + 1);
  };

  for (let i = 0; i < m; ++i) {
    DFS(i, 0);
    DFS(i, n - 1);
  }
  for (let j = 0; j < n; ++j) {
    DFS(0, j);
    DFS(m - 1, j);
  }
  for (let i = 0; i < m; ++i) {
    for (let j = 0; j < n; ++j) {
      board[i][j] = board[i][j] === "+" ? "O" : "X";
    }
  }
};
// @lc code=end

solve([
  ["X", "X", "X", "X"],
  ["X", "O", "O", "X"],
  ["X", "X", "O", "X"],
  ["X", "O", "X", "X"],
]);
