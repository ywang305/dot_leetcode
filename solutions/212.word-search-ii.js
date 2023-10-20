/*
 * @lc app=leetcode id=212 lang=javascript
 *
 * [212] Word Search II
 */

// @lc code=start
/**
 * @param {character[][]} board
 * @param {string[]} words
 * @return {string[]}
 */
var findWords = function (board, words) {
  class Trie {
    insert(arr) {
      let node = this;
      for (const e of arr) {
        node[e] = node[e] ?? new Trie();
        node = node[e];
      }
      node.isEnd = true;
    }
    has(arr) {
      let node = this;
      for (const e of arr) {
        if (!(e in node)) return false;
        node = node[e];
      }
      return node.isEnd;
    }
    startsWith(prefixArr) {
      let node = this;
      for (const e of prefixArr) {
        if (!(e in node)) return false;
        node = node[e];
      }
      return true;
    }
  }

  const trie = new Trie();
  words.forEach((word) => trie.insert(word.split("")));
  const m = board.length;
  const n = board[0].length;
  const visited = Array.from({ length: m }, () =>
    Array.from({ length: n }, () => false)
  );
  const res = new Set();
  const dfs = (i, j, curStr) => {
    if (i < 0 || j < 0 || i >= m || j >= n || visited[i][j]) return;
    curStr += board[i][j];
    if (!trie.startsWith(curStr.split(""))) return;
    if (trie.has(curStr.split(""))) res.add(curStr);

    visited[i][j] = true;
    dfs(i + 1, j, curStr);
    dfs(i - 1, j, curStr);
    dfs(i, j + 1, curStr);
    dfs(i, j - 1, curStr);
    visited[i][j] = false;
  };

  for (let i = 0; i < m; ++i) {
    for (let j = 0; j < n; ++j) {
      dfs(i, j, "");
    }
  }
  return [...res];
};
// @lc code=end
