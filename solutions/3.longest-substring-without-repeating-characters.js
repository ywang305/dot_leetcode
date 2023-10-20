/*
 * @lc app=leetcode id=3 lang=javascript
 *
 * [3] Longest Substring Without Repeating Characters
 */

// @lc code=start
/**
 * @param {string} s
 * @return {number}
 */
var lengthOfLongestSubstring = function (s) {
  const map = new Map();
  let max = 0;
  for (let i = 0, j = 0; j < s.length; ++j) {
    if (map.has(s[j])) {
      i = Math.max(i, map.get(s[j]) + 1); // 这里易错 i=map.get(s[j])+1
    }
    map.set(s[j], j);
    max = Math.max(max, j - i + 1);
  }
  return max;
};
// @lc code=end

lengthOfLongestSubstring("abba");
