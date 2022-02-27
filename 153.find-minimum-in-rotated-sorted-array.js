/*
 * @lc app=leetcode id=153 lang=javascript
 *
 * [153] Find Minimum in Rotated Sorted Array
 */

// @lc code=start
/**
 * @param {number[]} nums
 * @return {number}
 */
var findMin = function (nums) {
  let l = 0;
  let r = nums.length - 1;
  let res = nums[0];
  while (l <= r) {
    const m = parseInt(l + (r - l) / 2);
    res = Math.min(res, nums[l], nums[m]); // 这三个地方可能最小值
    if (nums[m] > nums[r]) {
      // right side is unsorted
      l = m + 1;
    } else if (nums[m] < nums[l]) {
      // left side is unsorted
      r = m - 1;
    } else {
      break;
    }
  }
  return res;
};
// @lc code=end
