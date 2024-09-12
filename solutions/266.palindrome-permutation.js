/**
 * @param {string} s
 * @return {boolean}
 */
var canPermutePalindrome = function (s) {
  const hash = new Map();
  for (const c of s) {
    val = ((hash.get(c) || 0) + 1) % 2;
    hash.set(c, val);
  }
  let cntOne = 0;
  for (const val of hash.values()) {
    if (val === 1) cntOne += 1;
    if (cntOne > 1) return false;
  }
  return true;
};
/**
 *
给你一个字符串 s ，如果该字符串的某个排列是
回文串, 则返回 true ；否则，返回 false 。

示例 1：
输入：s = "code"
输出：false
示例 2：
输入：s = "aab"
输出：true
示例 3：
输入：s = "carerac"
输出：true

提示：
1 <= s.length <= 5000
s 仅由小写英文字母组成

 *
 */
