/**
 * @param {number[]} nums
 * @return {number}
 */
var findMaxConsecutiveOnes = function (nums) {
  let countZero = 0;
  let i = 0;
  let ans = 0;
  for (let j = 0; j < nums.length; ++j) {
    const cur = nums[j];
    if (cur === 0) countZero += 1;
    while (countZero === 2) {
      const pre = nums[i];
      if (pre === 0) countZero -= 1;
      i += 1;
    }
    ans = Math.max(ans, j - i + 1);
  }
  return ans;
};

/**
 *
给定一个二进制数组 nums ，如果最多可以翻转一个 0 ，则返回数组中连续 1 的最大个数。



示例 1：

输入：nums = [1,0,1,1,0]
输出：4
解释：翻转第一个 0 可以得到最长的连续 1。
     当翻转以后，最大连续 1 的个数为 4。
示例 2:

输入：nums = [1,0,1,1,0,1]
输出：4


提示:

1 <= nums.length <= 105
nums[i] 不是 0 就是 1.


进阶：如果输入的数字是作为 无限流 逐个输入如何处理？换句话说，内存不能存储下所有从流中输入的数字。您可以有效地解决吗？


 *
 */
