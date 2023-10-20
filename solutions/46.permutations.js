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
  // if (nums.length <= 1) return nums.map((e) => [e]);
  // const res = [];
  // for (let i = 0; i < nums.length; ++i) {
  //   permute(nums.slice(0, i).concat(nums.slice(i + 1))).forEach((list) => {
  //     res.push(list.concat(nums[i]));
  //   });
  // }
  // return res;

  const res = [];
  const dfs = (start) => {
    if (start === nums.length) {
      res.push([...nums]);
      return;
    }
    for (let i = start; i < nums.length; ++i) {
      [nums[i], nums[start]] = [nums[start], nums[i]];
      dfs(start + 1);
      [nums[i], nums[start]] = [nums[start], nums[i]];
    }
  };
  dfs(0);
  return res;
};
// @lc code=end
