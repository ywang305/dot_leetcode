/**
 * 
 * Given an array of meeting time intervals intervals where intervals[i] = [starti, endi], 
 * return the minimum number of conference rooms required.} intervals 

Example 1:

Input: intervals = [[0,30],[5,10],[15,20]]
Output: 2


Example 2:

Input: intervals = [[7,10],[2,4]]
Output: 1
 */

/**
 * @param {number[][]} intervals
 * @return {number}
 */
var minMeetingRooms = function (intervals) {
  const starts = intervals.map((x) => x[0]).sort((a, b) => a - b);
  const ends = intervals.map((x) => x[1]).sort((a, b) => a - b);
  let s = 0,
    e = 0,
    count = 0,
    res = 0;
  while (s < starts.length) {
    if (starts[s] < ends[e]) {
      s += 1;
      count += 1;
    } else {
      e += 1;
      count -= 1;
    }
    res = Math.max(res, count);
  }
  return res;
};
