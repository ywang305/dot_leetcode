/**
 * 
 * Given a string s, return the length of the longest substring that contains at most two distinct characters.

Example 1:

Input: s = "eceba"
Output: 3
Explanation: The substring is "ece" which its length is 3.
Example 2:

Input: s = "ccaabbb"
Output: 5
Explanation: The substring is "aabbb" which its length is 5.
 */

var lengthOfLongestSubstringTwoDistinct = function (s) {
  const memo = new Map();
  let res = 0;
  for (let i = 0, j = 0; j < s.length; ++j) {
    const c = s[j];
    if (!memo.has(c) && memo.size === 2) {
      // remove the most left pos in memo
      const minPos = Math.min(...memo.values());
      const foundKey = [...memo].find(([k, v]) => v === minPos)[0];
      memo.delete(foundKey);
      i = minPos + 1;
    }
    memo.set(c, j);
    res = Math.max(res, j - i + 1);
  }
  return res;
};
