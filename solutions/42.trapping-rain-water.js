/*
 * @lc app=leetcode id=42 lang=javascript
 *
 * [42] Trapping Rain Water
 */

// @lc code=start
/**
 * @param {number[]} height
 * @return {number}
 */
var trap = function (height) {
  // Monotonic decreasing stack
  const stack = [];
  let sum = 0;
  for (let i = 0; i < height.length; ++i) {
    while (height[i] > height[stack.at(-1)]) {
      const cur = stack.pop();
      if (!stack.length) break;
      const left = stack.at(-1);
      const right = i;
      sum +=
        (Math.min(height[left], height[right]) - height[cur]) *
        (right - left - 1);
    }
    stack.push(i);
  }
  return sum;

  /**
    // dp 清晰
    const dp = Array.from({length: height.length}, ()=>({}));
    let mx = height[0];
    for(let i=1; i<height.length; ++i) {
        dp[i].left = mx;
        mx = Math.max(height[i], mx);
    }
    mx = height[height.length-1];
    for(let i=height.length-2; i>=0; --i) {
        dp[i].right = mx;
        mx = Math.max(height[i], mx);
    }
    let res = 0;
    for(let i=1; i<height.length-1; ++i) {
        const {left, right} = dp[i];
        const bottleneck = Math.min(left, right);
        if(level>height[i]) {
            res += bottleneck - height[i];
        }
    }
    return res;
   */
};
// @lc code=end
