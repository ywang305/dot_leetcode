/*
 * @lc app=leetcode id=394 lang=javascript
 *
 * [394] Decode String
 */

// @lc code=start

/**
 * @param {string} s
 * @return {string}
 */
var decodeString = function (s) {
  const numStack = [];
  const strStack = [];
  let res = "";
  let cnt = 0;
  for (const c of s) {
    if (c === "[") {
      numStack.push(cnt);
      cnt = 0;
      strStack.push(res);
      res = "";
    } else if (c === "]") {
      let tmpStr = strStack.pop();
      const num = numStack.pop();
      for (let i = 0; i < num; ++i) {
        tmpStr += res;
      }
      res = tmpStr;
    } else if (isNaN(c)) {
      res += c;
    } else {
      cnt = cnt * 10 + Number(c);
    }
  }
  return res;
};
// @lc code=end
