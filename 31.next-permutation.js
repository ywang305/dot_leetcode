/*
 * @lc app=leetcode id=31 lang=javascript
 *
 * [31] Next Permutation
 */

// @lc code=start
/**
 * @param {number[]} nums
 * @return {void} Do not return anything, modify nums in-place instead.
 */
var nextPermutation = function (nums) {
  //还是不会，参见 Grandyang,  [1　　2　　7　　4　　3　　1]
  let firstDesc = nums.length - 2,
    toSwap = nums.length - 1;
  while (firstDesc >= 0 && nums[firstDesc] >= nums[firstDesc + 1]) {
    // firstDesc 指到 元素2
    --firstDesc;
  }
  if (firstDesc >= 0) {
    const swap = (idx1, idx2) =>
      ([nums[idx1], nums[idx2]] = [nums[idx2], nums[idx1]]);
    while (nums[toSwap] <= nums[firstDesc]) --toSwap; //从后找到第一个比firstDesc大, 如 3
    swap(firstDesc, toSwap); // 1 3 ( 7 4 2 1 ), 下一步 7 4 2 1 翻过来 得到答案 1 3 1 2 4 7
    for (let i = firstDesc + 1, j = nums.length - 1; i < j; ++i, --j) {
      swap(i, j);
    }
  } else {
    nums.reverse();
  }
};
// @lc code=end

nextPermutation([5, 1, 1]);
