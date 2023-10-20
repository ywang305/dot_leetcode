/*
 * @lc app=leetcode id=30 lang=javascript
 *
 * [30] Substring with Concatenation of All Words
 */

// @lc code=start
/**
 * @param {string} s
 * @param {string[]} words
 * @return {number[]}
 */
var findSubstring = function (s, words) {
  const wlen = words[0].length;
  const wslen = words.length;
  const m1 = new Map();

  words.forEach((w) => {
    m1.set(w, m1.has(w) ? m1.get(w) + 1 : 1);
  });

  let res = [];
  for (let i = 0; i < s.length - wslen * wlen + 1; ++i) {
    // key1: i的结束条件
    const m2 = new Map();
    let j = 0;
    for (; j < wslen; j++) {
      const substr = s.substr(i + j * wlen, wlen);
      if (!m1.has(substr)) break;
      m2.set(substr, m2.has(substr) ? m2.get(substr) + 1 : 1);
      if (m2.get(substr) > m1.get(substr)) break;
    }
    if (j === wslen) {
      // 如果j能遍历到wslen，说明 m2 和 m1 的内容是一样的
      res.push(i);
    }
  }

  return res; // 这题用 permute 会 TLE
};
// @lc code=end
