/*
 * @lc app=leetcode id=85 lang=javascript
 *
 * [85] Maximal Rectangle
 */

// @lc code=start
/**
 * @param {character[][]} matrix
 * @return {number}
 */
var maximalRectangle = function (matrix) {
  const largestRectangleArea = (heights) => {
    heights = [0, ...heights, 0]; // 前后+哨兵，保证left边界存在，和最后一次必出栈
    const stack = [];
    let maxArea = 0;
    for (let i = 0; i < heights.length; ++i) {
      while (heights[i] < heights[stack.at(-1)]) {
        const cur = stack.pop();
        const left = stack.at(-1) + 1;
        const right = i - 1;
        maxArea = Math.max(maxArea, heights[cur] * (right - left + 1));
      }
      stack.push(i);
    }
    return maxArea;
  };

  const m = matrix.length,
    n = matrix[0].length;
  let maxArea = 0;
  const heights = Array.from({ length: n }, () => 0);
  for (let i = 0; i < m; ++i) {
    for (let j = 0; j < n; ++j) {
      if (matrix[i][j] === "1") heights[j] += 1;
      else heights[j] = 0;
    }
    maxArea = Math.max(maxArea, largestRectangleArea(heights));
  }
  return maxArea;
};
// @lc code=end
