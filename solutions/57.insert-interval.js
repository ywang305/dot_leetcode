/*
 * @lc app=leetcode id=57 lang=javascript
 *
 * [57] Insert Interval
 */

// @lc code=start
/**
 * @param {number[][]} intervals
 * @param {number[]} newInterval
 * @return {number[][]}
 */
var insert = function (intervals, newInterval) {
  let [start, end] = newInterval;
  const res = [];
  for (let i = 0; i < intervals.length; ++i) {
    const [s, e] = intervals[i];
    if (end < s) {
      // no overlap afterward, return res
      res.push([start, end], ...intervals.slice(i));
      return res;
    } else if (start > e) {
      // no overlap before, push original interval
      res.push([s, e]);
    } else {
      // overlap, update start and end
      start = Math.min(start, s);
      end = Math.max(end, e);
    }
  }

  res.push([start, end]);
  return res;
};
// @lc code=end
