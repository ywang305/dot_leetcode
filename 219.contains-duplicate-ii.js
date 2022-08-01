/*
 * @lc app=leetcode id=219 lang=javascript
 *
 * [219] Contains Duplicate II
 */

// @lc code=start
/**
 * @param {number[]} nums
 * @param {number} k
 * @return {boolean}
 */
var containsNearbyDuplicate = function (nums, k) {
  const m = new Map();
  for (let i = 0; i < nums.length; ++i) {
    if (m.get(nums[i]) >= i - k) {
      return true;
    }
    m.set(nums[i], i);
  }
  return false;
};
// @lc code=end

containsNearbyDuplicate([1, 2, 3, 1, 2, 3], 2);
