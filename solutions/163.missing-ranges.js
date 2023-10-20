// leetcode 163 missing-ranges.js
/*
  * @lc app=leetcode id=163 lang=javascript
  *
  * [163] Missing Ranges
  * Given a sorted integer array nums, where the range of elements are in the inclusive range [lower, upper], return its missing ranges.
  *   
  *  Example:
      Input: nums = [0,1,3,50,75], lower = 0, upper = 99
      Output: ["2","4->49","51->74","76->99"]
      Explanation: The ranges are:
      [2,2] --> "2"
      [4,49] --> "4->49"
      [51,74] --> "51->74"
      [76,99] --> "76->99"

    Example2:
      Input: nums = [-1], lower = -1, upper = -1
      Output: []
      Explanation: There are no missing ranges since there are no missing numbers.
  *   
*/

/**
 * @param {number[]} nums
 * @param {number} lower
 * @param {number} upper
 * @return {string[]}
 */
var findMissingRanges = function (nums, lower, upper) {
  const res = [];
  let pre = lower - 1;
  for (let i = 0; i <= nums.length; ++i) {
    let cur = i < nums.length ? nums[i] : upper + 1;
    if (pre + 1 <= cur - 1) {
      res.push(pre + 1 === cur - 1 ? `${pre + 1}` : `${pre + 1}->${cur - 1}`);
    }
    pre = cur;
  }
  return res;
};
