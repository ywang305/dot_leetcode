/*
 * @lc app=leetcode id=37 lang=javascript
 *
 * [37] Sudoku Solver
 */

// @lc code=start
/**
 * @param {character[][]} board
 * @return {void} Do not return anything, modify board in-place instead.
 */
var solveSudoku = function (board) {
  const m = board.length;

  const isValid = (x, y, val) => {
    for (let i = 0; i < m; ++i) {
      if (board[i][y] === val && i !== x) return false;
    }
    for (let j = 0; j < m; ++j) {
      if (board[x][j] === val && j !== y) return false;
    }
    const x0 = parseInt(x / 3) * 3;
    const y0 = parseInt(y / 3) * 3;
    for (let i = x0; i < x0 + 3; ++i) {
      for (let j = y0; j < y0 + 3; ++j) {
        if (board[i][j] === val && i !== x && j !== y) return false;
      }
    }
    return true;
  };

  const getNextCoord = (x, y) => {
    if (board[x][y] === ".") return [x, y];
    const nx = (y + 1) % m === 0 ? x + 1 : x;
    if (nx === m) return [-1, -1];
    const ny = (y + 1) % m;
    return getNextCoord(nx, ny);
  };

  const vals = Array.from({ length: m }, (_, i) => String(i + 1));

  const dfs = (x, y) => {
    const [nx, ny] = getNextCoord(x, y);
    if (nx === -1) return true;
    for (const val of vals) {
      if (isValid(nx, ny, val)) {
        board[nx][ny] = val;
        if (dfs(nx, ny)) return true;
        board[nx][ny] = ".";
      }
    }
    return false;
  };

  dfs(0, 0);
};
// @lc code=end
