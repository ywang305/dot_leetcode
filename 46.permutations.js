/*
 * @lc app=leetcode id=46 lang=javascript
 *
 * [46] Permutations
 */

// @lc code=start
/**
 * @param {number[]} nums
 * @return {number[][]}
 */
var permute = function (nums) {
  if (nums.length <= 1) return nums.map((e) => [e]);
  const res = [];
  for (let i = 0; i < nums.length; ++i) {
    permute(nums.slice(0, i).concat(nums.slice(i + 1))).forEach((list) => {
      res.push(list.concat(nums[i]));
    });
  }
  return res;
};
// @lc code=end
