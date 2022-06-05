/*
 * @lc app=leetcode id=80 lang=javascript
 *
 * [80] Remove Duplicates from Sorted Array II
 */

// @lc code=start
/**
 * @param {number[]} nums
 * @return {number}
 */
var removeDuplicates = function (nums) {
  let i = 0;
  for (let j = 0; j < nums.length; ++j) {
    if (nums[j] !== nums[i - 2]) {
      nums[i] = nums[j];
      ++i;
    }
  }
  return i;
};
// @lc code=end
