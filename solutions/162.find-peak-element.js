/*
 * @lc app=leetcode id=162 lang=javascript
 *
 * [162] Find Peak Element
 */

// @lc code=start
/**
 * @param {number[]} nums
 * @return {number}
 */
var findPeakElement = function (nums) {
  let i = 0,
    j = nums.length - 1;
  while (i < j) {
    let mid = Math.floor(i + (j - i) / 2);
    if (nums[mid] < nums[mid + 1]) {
      i = mid + 1; //  rising slope， mid is not peak， so we need to search right part
    } else {
      j = mid; // not mid-1 as usual，因为mid也可能是解 desc slope
    }
  }
  return j;
};
// @lc code=end
