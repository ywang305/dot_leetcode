/*
 * @lc app=leetcode id=187 lang=javascript
 *
 * [187] Repeated DNA Sequences
 */

// @lc code=start
/**
 * @param {string} s
 * @return {string[]}
 */
var findRepeatedDnaSequences = function (s) {
  const m = new Map();
  for (let i = 10; i <= s.length; ++i) {
    const sub = s.slice(i - 10, i);
    m.set(sub, (m.get(sub) ?? 0) + 1);
  }
  return [...m].filter(([, v]) => v > 1).map(([k]) => k);
};
// @lc code=end

findRepeatedDnaSequences("AAAAAAAAAAA");
