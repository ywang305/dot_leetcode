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
  let res = 0;
  let bottleneck = 0;
  let left = 0,
    right = height.length - 1;
  while (left < right) {
    const lower = height[height[left] < height[right] ? left++ : right--];
    bottleneck = Math.max(bottleneck, lower);
    res += bottleneck - lower;
  }
  return res;

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
