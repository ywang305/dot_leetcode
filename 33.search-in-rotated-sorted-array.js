/*
 * @lc app=leetcode id=33 lang=javascript
 *
 * [33] Search in Rotated Sorted Array
 */

// @lc code=start
/**
 * @param {number[]} nums
 * @param {number} target
 * @return {number}
 */
var search = function (nums, target) {
  let i = 0,
    j = nums.length - 1;
  while (i <= j) {
    const m = i + ((j - i) >> 1);
    if (nums[m] === target) {
      return m;
    }
    // 如果左边有序
    if (nums[i] <= nums[m]) {
      // target在左边范围内
      if (nums[i] <= target && target < nums[m]) {
        j = m - 1;
      } else {
        i = m + 1;
      }
    }
    // 如果右边有序
    else {
      // target在右边范围内
      if (nums[m] < target && nums[j] >= target) {
        i = m + 1;
      } else {
        j = m - 1;
      }
    }
  }

  return -1;
};
// @lc code=end
