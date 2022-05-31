/*
 * @lc app=leetcode id=76 lang=javascript
 *
 * [76] Minimum Window Substring
 */

// @lc code=start
/**
 * @param {string} s
 * @param {string} t
 * @return {string}
 */
var minWindow = function (s, t) {
  const need = new Map();
  for (const c of t) need.set(c, (need.get(c) ?? 0) + 1);

  let needCnt = t.length; // key1: 关键控制变量
  let res;
  let i = 0;
  for (let j = 0, c = s[j]; j < s.length; c = s[++j]) {
    // key2 : 扩大窗口
    if (need.has(c)) {
      if (need.get(c) > 0) needCnt--;
      need.set(c, need.get(c) - 1);
    }

    // key3 : 缩小窗口
    while (needCnt === 0) {
      res =
        res === undefined || res.length > j - i + 1 ? s.slice(i, j + 1) : res;
      if (need.has(s[i])) {
        // key4: 如果是负数，说明是多余的； 否则需要恢复needCnt
        if (need.get(s[i]) >= 0) {
          needCnt++;
        }
        need.set(s[i], need.get(s[i]) + 1);
      }
      ++i;
    }
  }
  return res === undefined ? "" : res;
};
// @lc code=end

minWindow("DOABECODEBANC", "ABC");
