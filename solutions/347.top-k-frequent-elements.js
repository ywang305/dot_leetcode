/*
 * @lc app=leetcode id=347 lang=javascript
 *
 * [347] Top K Frequent Elements
 */

// @lc code=start
/**
 * @param {number[]} nums
 * @param {number} k
 * @return {number[]}
 */
var topKFrequent = function (nums, k) {
  const map = new Map(); // {num: count}
  for (const num of nums) {
    map.set(num, (map.get(num) ?? 0) + 1);
  }
  const buckets = [];
  [...map.entries()].forEach(([num, count]) => {
    buckets[count] = buckets[count] ?? [];
    buckets[count].push(num);
  });
  const result = [];
  for (let i = buckets.length - 1; i >= 0; --i) {
    for (const num of buckets[i] ?? []) {
      result.push(num);
      if (result.length === k) return result;
    }
  }
  return result;
};
// @lc code=end
