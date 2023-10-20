/*
 * @lc app=leetcode id=47 lang=javascript
 *
 * [47] Permutations II
 */

// @lc code=start
/**
 * @param {number[]} nums
 * @return {number[][]}
 */
var permuteUnique = function (nums) {
  const s = new Set();
  const dfs = (start) => {
    if (start === nums.length) {
      s.add(nums.join(","));
      return;
    }
    for (let i = start; i < nums.length; ++i) {
      [nums[i], nums[start]] = [nums[start], nums[i]];
      dfs(start + 1);
      [nums[i], nums[start]] = [nums[start], nums[i]];
    }
  };

  dfs(0);
  return [...s].map((key) => key.split(",").map((x) => parseInt(x)));
};
// @lc code=end
