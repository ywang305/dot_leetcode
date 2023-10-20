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
  let i = 0;
  let j = nums.length - 1;
  let res = nums[0];
  while (i <= j) {
    const m = parseInt(i + (j - i) / 2);
    res = Math.min(res, nums[m]);
    if (nums[m] > nums[j]) {
      // right side is unsorted, min coulb be on right side, yet may still greater than res
      i = m + 1;
    } else if (nums[m] < nums[j]) {
      // left side is unsorted, min could be on num[m] or left side, yet may still greater than res
      j = m - 1;
    } else {
      break;
    }
  }
  return res;
};
// @lc code=end
findMin([3, 1, 2]);
