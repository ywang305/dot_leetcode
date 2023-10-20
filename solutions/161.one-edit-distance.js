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
  const len1 = s.length,
    len2 = t.length;
  if (len1 > len2) return isOneEditDistance(t, s);
  if (len2 - len1 > 1 || s === t) return false;

  let i = 0;
  while (s[i] === t[i] && i < len1) {
    ++i;
  }
  if (len1 === len2) {
    return s.slice(i + 1) === t.slice(i + 1);
  } else {
    return s.slice(i) === t.slice(i + 1);
  }
};
