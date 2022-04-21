/*
 * @lc app=leetcode id=4 lang=javascript
 *
 * [4] Median of Two Sorted Arrays
 */

// @lc code=start
/**
 * @param {number[]} nums1
 * @param {number[]} nums2
 * @return {number}
 */
var findMedianSortedArrays = function (nums1, nums2) {
  if (nums1.length < nums2.length) return findMedianSortedArrays(nums2, nums1);

  const len = nums1.length + nums2.length,
    halfLen = Math.floor(len / 2);

  let i = 0,
    j = nums2.length - 1;
  let nums2LeftLen = 0,
    nums1LeftLen = halfLen;
  while (i <= j) {
    let m = i + Math.floor((j - i) / 2);
    const _nums1LeftLen = halfLen - m - 1;
    if (
      nums2[m] <= nums1[_nums1LeftLen] &&
      /* 以下注意超界判断 */
      (nums1[_nums1LeftLen - 1] ?? -Infinity) <= (nums2[m + 1] ?? Infinity)
    ) {
      nums1LeftLen = _nums1LeftLen;
      nums2LeftLen = m + 1;
      break;
    }
    if (nums2[m] > nums1[_nums1LeftLen]) {
      j = m - 1;
    } else {
      i = m + 1;
    }
  }

  if (len % 2) {
    // odd length
    /* 以下注意超界判断 */
    return Math.min(nums1[nums1LeftLen], nums2[nums2LeftLen] ?? Infinity);
  } else {
    /* 以下注意超界判断 */
    return (
      (Math.max(
        nums1[nums1LeftLen - 1] ?? -Infinity,
        nums2[nums2LeftLen - 1] ?? -Infinity
      ) +
        Math.min(
          nums1[nums1LeftLen] ?? Infinity,
          nums2[nums2LeftLen] ?? Infinity
        )) /
      2
    );
  }
};
// @lc code=end
