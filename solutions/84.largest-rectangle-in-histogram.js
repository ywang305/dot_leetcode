/*
 * @lc app=leetcode id=84 lang=javascript
 *
 * [84] Largest Rectangle in Histogram
 */

// @lc code=start
/**
 * @param {number[]} heights
 * @return {number}
 */
var largestRectangleArea = function (heights) {
  const stack = [];
  let max = 0;
  heights.unshift(0); // for calculating the left bound
  heights.push(0); // in case end of loop, there is stack that has not been calculated
  for (let i = 0; i < heights.length; ++i) {
    while (heights[i] < heights[stack.at(-1)]) {
      const cur = stack.pop(); // for cur, need to find left/right bounds that >= cur
      const left = stack.at(-1) + 1; // key to find the left bound
      const right = i - 1;
      max = Math.max(max, heights[cur] * (right - left + 1));
    }
    stack.push(i);
  }
  return max;
};
// @lc code=end

largestRectangleArea([2, 1, 5, 6, 2, 3]);
