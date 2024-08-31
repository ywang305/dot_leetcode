/**
 * @param {string} s
 * @return {number}
 */
var lengthOfLongestSubstringTwoDistinct = function (s) {
  const hash = new Map();
  let i = 0;
  let ans = 0;
  for (let j = 0; j < s.length; ++j) {
    const c = s[j];
    freq_c = hash.get(c) ?? 0;
    hash.set(c, freq_c + 1);
    while (hash.size > 2) {
      const pre = s[i];
      hash.set(pre, hash.get(pre) - 1);
      if (hash.get(pre) === 0) hash.delete(pre);
      i += 1;
    }
    ans = Math.max(ans, j - i + 1);
  }
  return ans;
};
