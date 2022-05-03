/*
 * @lc app=leetcode id=34 lang=javascript
 *
 * [34] Find First and Last Position of Element in Sorted Array
 */

// @lc code=start
/**
 * @param {number[]} nums
 * @param {number} target
 * @return {number[]}
 */
var searchRange = function (nums, target) {
  const searchLowerBound = (nums, target) => {
    let i = 0;
    let j = nums.length - 1;
    let res = -1;
    while (i <= j) {
      const m = i + ((j - i) >> 1);
      if (nums[m] < target) i = m + 1;
      else if (nums[m] > target) j = m - 1;
      else {
        res = m;
        j = m - 1;
      }
    }
    return res;
  };

  const searchUpperBound = (nums, target) => {
    let i = 0;
    let j = nums.length - 1;
    let res = -1;
    while (i <= j) {
      const m = i + ((j - i) >> 1);
      if (nums[m] < target) i = m + 1;
      else if (nums[m] > target) j = m - 1;
      else {
        res = m;
        i = m + 1;
      }
    }
    return res;
  };

  return [searchLowerBound(nums, target), searchUpperBound(nums, target)];
};
// @lc code=end
