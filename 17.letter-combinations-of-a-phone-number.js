/*
 * @lc app=leetcode id=17 lang=javascript
 *
 * [17] Letter Combinations of a Phone Number
 */

// @lc code=start
/**
 * @param {string} digits
 * @return {string[]}
 */
var letterCombinations = function (digits) {
  const arr = [
    "",
    "",
    "abc",
    "def",
    "ghi",
    "jkl",
    "mno",
    "pqrs",
    "tuv",
    "wxyz",
  ];
  const combine = (index) => {
    if (index === digits.length) return [];
    const d = digits[index];
    const res = [];
    for (const c of arr[d]) {
      const subArr = combine(index + 1);
      if (subArr.length === 0) res.push(c);
      subArr.forEach((sub) => res.push(c + sub));
    }
    return res;
  };
  return combine(0);
};
// @lc code=end
