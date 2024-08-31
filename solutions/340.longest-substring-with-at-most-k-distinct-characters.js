/**
 * @param {string} s
 * @param {number} k
 * @return {number}
 */
var lengthOfLongestSubstringKDistinct = function (s, k) {
  const hash = new Map();
  let i = 0;
  let ans = 0;
  for (let j = 0; j < s.length; ++j) {
    hash.set(s[j], (hash.get(s[j]) || 0) + 1);
    while (hash.size > k) {
      const pre = s[i];
      hash.set(pre, hash.get(pre) - 1);
      if (hash.get(pre) === 0) hash.delete(pre);
      i += 1;
    }
    ans = Math.max(ans, j - i + 1);
  }
  return ans;
};
