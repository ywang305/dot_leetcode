/*
 * @lc app=leetcode id=164 lang=javascript
 *
 * [164] Maximum Gap
 */

// @lc code=start
/**
 * @param {number[]} nums
 * @return {number}
 */
var maximumGap = function (nums) {
  const mx = Math.max(...nums);
  const mn = Math.min(...nums);
  const interval = (mx - mn) / (nums.length - 1);
  const bucketIndexMappingFunc = (num) => Math.floor((num - mn) / interval);

  let buckets = [];
  nums.forEach((num) => {
    bucketIndex = bucketIndexMappingFunc(num);
    buckets[bucketIndex] = buckets[bucketIndex] ?? [];
    buckets[bucketIndex].push(num);
  });

  buckets = buckets.filter((bucket) => bucket?.length > 0);
  let maxGap = 0;
  let preMax; // max element in previous bucket
  for (let i = 0; i < buckets.length; ++i) {
    if (i > 0) {
      const curMin = Math.min(...buckets[i]); // min element in current bucket
      maxGap = Math.max(maxGap, Math.min(...buckets[i]), curMin - preMax); // according Pigeonhole principle, the gap between two consecutive buckets is the maximum gap
    }
    preMax = Math.max(...buckets[i]);
  }
  return maxGap;
};
// @lc code=end

maximumGap([3, 6, 9, 1]);
