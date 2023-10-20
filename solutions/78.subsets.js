/*
 * @lc app=leetcode id=78 lang=javascript
 *
 * [78] Subsets
 */

// @lc code=start
/**
 * @param {number[]} nums
 * @return {number[][]}
 */
var subsets = function (nums) {
  /*
  if (nums.length === 0) return [[]];
  const res = [[]];
  for (let i = 0; i < nums.length; ++i) {
    res.push([nums[i]]);
    const subs = subsets(nums.slice(i + 1));
    subs.forEach((sub) => {
      if (sub.length) {
        res.push([nums[i], ...sub]);
      }
    });
  }
  return res;
  */

  const res = [];
  const cur = [];
  const dfs = (start) => {
    res.push(cur.slice()); // key: just as that
    for (let i = start; i < nums.length; ++i) {
      cur.push(nums[i]);
      dfs(i + 1);
      cur.pop();
    }
  };
  dfs(0);
  return res;
};
// @lc code=end
