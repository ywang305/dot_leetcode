/*
 * @lc app=leetcode id=51 lang=javascript
 *
 * [51] N-Queens
 */

// @lc code=start
/**
 * @param {number} n
 * @return {string[][]}
 */
var solveNQueens = function (n) {
  const board = Array.from({ length: n }, () =>
    Array.from({ length: n }, () => ".")
  );

  const isValid = (i, j) => {
    // 1. 由于放置规则（每行只一个Q）， 不用check行
    // 2. check col, only i 以上
    for (let row = 0; row < i; ++row) {
      if (board[row][j] === "Q") return false;
    }
    // check diagonal
    for (let row = i - 1, col = j - 1; row >= 0 && col >= 0; --row, --col) {
      if (board[row][col] === "Q") return false;
    }
    // check anti-diagonal
    for (let row = i - 1, col = j + 1; row >= 0 && col < n; --row, ++col) {
      if (board[row][col] === "Q") return false;
    }
    return true;
  };

  const res = [];

  const DFS = (row) => {
    if (row === n) {
      res.push(board.map((row) => row.join("")));
      return;
    }
    for (let col = 0; col < n; ++col) {
      if (isValid(row, col)) {
        board[row][col] = "Q";
        DFS(row + 1);
        board[row][col] = ".";
      }
    }
  };

  DFS(0);
  return res;
};
// @lc code=end
