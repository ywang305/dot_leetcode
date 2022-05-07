/*
 * @lc app=leetcode id=45 lang=javascript
 *
 * [45] Jump Game II
 */

// @lc code=start
/**
 * @param {number[]} nums
 * @return {number}
 */
var jump = function (nums) {
  // const dp = [0];
  // for (let j = 0; j < nums.length; ++j) {
  //   for (let i = 0; i < j; ++i) {
  //     // search all possible positions before j
  //     if (nums[i] + i >= j) {
  //       dp[j] = dp[j] ? Math.min(dp[j], dp[i] + 1) : dp[i] + 1;
  //     }
  //   }
  // }
  // return dp[nums.length - 1];

  let cnt = 0;
  let left = 0,
    right = 0;
  while (right < nums.length - 1) {
    cnt++;
    const originRight = right;
    for (let i = left; i <= originRight; ++i) {
      right = Math.max(right, i + nums[i]);
    }
    left = originRight + 1;
  }
  return cnt;
};
// @lc code=end

jump([2, 3, 1, 1, 4]);
