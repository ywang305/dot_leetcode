/*
 * @lc app=leetcode id=15 lang=javascript
 *
 * [15] 3Sum
 */

// @lc code=start
/**
 * @param {number[]} nums
 * @return {number[][]}
 */
var threeSum = function (nums) {
  nums.sort((a, b) => a - b);
  const len = nums.length;
  const res = new Set();

  for (let i = 0; i < len - 2; ++i) {
    let j = i + 1,
      k = len - 1;
    while (j < k) {
      const [a, b, c] = [nums[i], nums[j], nums[k]];
      const sum = a + b + c;
      if (sum < 0) ++j;
      else if (sum > 0) --k;
      else {
        res.add(`${a},${b},${c}`);
        ++j;
        --k;
      }
    }
  }
  return [...res].map((str) => str.split(","));
};
// @lc code=end
const res = threeSum([-1, 0, 1, 2, -1, -4]);
console.log(res);
