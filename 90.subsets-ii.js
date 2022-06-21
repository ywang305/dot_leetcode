/*
 * @lc app=leetcode id=90 lang=javascript
 *
 * [90] Subsets II
 */

// @lc code=start
/**
 * @param {number[]} nums
 * @return {number[][]}
 */
var subsetsWithDup = function (nums) {
  /**
  var subsetsWithDup = function(nums, sorted=false) {
    if(nums.length===0) return [[]];
    if(!sorted) nums.sort((a,b)=>a-b);
    
    const res = [[]];
    for(let i=0; i<nums.length; ++i) {
        if(i===0 || nums[i]!=nums[i-1]) {
            res.push([nums[i]]);
            subsetsWithDup(nums.slice(i+1), true).forEach(arr=>{
                if(arr.length) {
                    res.push([nums[i], ...arr]);
                }
            });
        }
    }
    return res;
  };
   */

  nums.sort((a, b) => a - b);
  const res = [];
  const cur = [];
  const dfs = (start) => {
    res.push(cur.slice());
    for (let i = start; i < nums.length; ++i) {
      if (i > start && nums[i] === nums[i - 1]) continue;
      cur.push(nums[i]);
      dfs(i + 1);
      cur.pop();
    }
  };
  dfs(0);
  return res;
};
// @lc code=end
