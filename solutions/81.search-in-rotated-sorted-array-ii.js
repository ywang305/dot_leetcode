/*
 * @lc app=leetcode id=81 lang=javascript
 *
 * [81] Search in Rotated Sorted Array II
 */

// @lc code=start
/**
 * @param {number[]} nums
 * @param {number} target
 * @return {boolean}
 */
var search = function (nums, target) {
  let i = 0,
    j = nums.length - 1;
  while (i <= j) {
    const m = i + ((j - i) >> 1);
    if (target === nums[m]) {
      return true;
    }

    if (nums[i] < nums[m]) {
      // left side in order
      if (nums[i] <= target && target < nums[m]) {
        j = m - 1;
      } else {
        i = m + 1;
      }
    } else if (nums[i] > nums[m]) {
      // right side in order
      if (nums[m] < target && target <= nums[j]) {
        i = m + 1;
      } else {
        j = m - 1;
      }
    } else {
      // special case of nums[i] === nums[m]
      ++i;
    }
  }
  return false;
};
// @lc code=end
