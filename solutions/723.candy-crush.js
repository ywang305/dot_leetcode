/**
 * @param {number[][]} board
 * @return {number[][]}
 */
var candyCrush = function (board) {
  const m = board.length;
  const n = board[0].length;

  const mark = () => {
    const toErase = new Set();
    for (let i = m - 1; i >= 0; --i) {
      for (let j = 0; j < n; ++j) {
        cur = board[i][j];
        if (cur === 0) continue;
        if (
          j > 0 &&
          j < n - 1 &&
          board[i][j - 1] === cur &&
          board[i][j + 1] === cur
        ) {
          toErase
            .add(i + "#" + (j - 1))
            .add(i + "#" + j)
            .add(i + "#" + (j + 1));
        }
        if (i < m - 2 && board[i + 1][j] === cur && board[i + 2][j] === cur) {
          toErase
            .add(i + "#" + j)
            .add(i + 1 + "#" + j)
            .add(i + 2 + "#" + j);
        }
      }
    }
    return [...toErase].map((key) => key.split("#"));
  };

  const erase = () => {
    for (let j = 0; j < n; ++j) {
      let pre = -1;
      for (let i = m - 1; i >= 0; --i) {
        if (board[i][j] == 0) {
          if (pre === -1) pre = i;
          continue;
        }
        if (i < m - 1 && board[i + 1][j] === 0) {
          tmp = board[i][j];
          board[i][j] = board[pre][j];
          board[pre][j] = tmp;
          pre -= 1;
        }
      }
    }
  };

  let que = mark();
  while (que.length) {
    que.forEach(([x, y]) => {
      board[x][y] = 0;
    });
    erase();
    que = mark();
  }
  return board;
};

/**
 *
 * 这个问题是实现一个简单的消除算法。

给定一个 m x n 的二维整数数组 board 代表糖果所在的方格，不同的正整数 board[i][j] 代表不同种类的糖果，如果 board[i][j] == 0 代表 (i, j) 这个位置是空的。

给定的方格是玩家移动后的游戏状态，现在需要你根据以下规则粉碎糖果，使得整个方格处于稳定状态并最终输出：

如果有三个及以上水平或者垂直相连的同种糖果，同一时间将它们粉碎，即将这些位置变成空的。
在同时粉碎掉这些糖果之后，如果有一个空的位置上方还有糖果，那么上方的糖果就会下落直到碰到下方的糖果或者底部，这些糖果都是同时下落，也不会有新的糖果从顶部出现并落下来。
通过前两步的操作，可能又会出现可以粉碎的糖果，请继续重复前面的操作。
当不存在可以粉碎的糖果，也就是状态稳定之后，请输出最终的状态。
你需要模拟上述规则并使整个方格达到稳定状态，并输出。
 *
 *
 */
