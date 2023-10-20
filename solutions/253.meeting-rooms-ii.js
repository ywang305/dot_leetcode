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
  const starts = [];
  const ends = [];
  for (const [s, e] of intervals) {
    starts.push(s);
    ends.push(e);
  }
  starts.sort((a, b) => a - b);
  ends.sort((a, b) => a - b);
  let s = 0,
    e = 0,
    count = 0,
    max = 0;
  while (s < starts.length) {
    if (starts[s] < ends[e]) {
      ++s;
      ++count;
    } else {
      ++e;
      --count;
    }
    max = Math.max(max, count);
  }
  return max;
};
