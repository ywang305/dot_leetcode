/**
 *
Given two strings s and t, return true if they are both one edit distance apart, otherwise return false.

A string s is said to be one distance apart from a string t if you can:

Insert exactly one character into s to get t.
Delete exactly one character from s to get t.
Replace exactly one character of s with a different character to get t.


Example 1:

Input: s = "ab", t = "acb"
Output: true
Explanation: We can insert 'c' into s to get t.
Example 2:

Input: s = "", t = ""
Output: false
Explanation: We cannot get t from s by only one step.

*/

/**
 * @param {string} s
 * @param {string} t
 * @return {boolean}
 */
var isOneEditDistance = function (s, t) {
  const ns = s.length;
  const nt = t.length;
  if (ns > nt) return isOneEditDistance(t, s);
  if (nt - ns > 1) return false;

  for (let i = 0; i < s.length; ++i) {
    if (s[i] === t[i]) continue;
    if (ns === nt) return s.slice(i + 1) === t.slice(i + 1);
    else return s.slice(i) === t.slice(i + 1);
  }
  return ns + 1 === nt;
};
