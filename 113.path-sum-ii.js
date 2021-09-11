/*
 * @lc app=leetcode id=113 lang=javascript
 *
 * [113] Path Sum II
 */

// @lc code=start
/**
 * Definition for a binary tree node.
 * function TreeNode(val, left, right) {
 *     this.val = (val===undefined ? 0 : val)
 *     this.left = (left===undefined ? null : left)
 *     this.right = (right===undefined ? null : right)
 * }
 */
/**
 * @param {TreeNode} root
 * @param {number} targetSum
 * @return {number[][]}
 */
var pathSum = function (root, targetSum) {
  if (!root) return [];
  if (!root.left && !root.right && root.val === targetSum) {
    return [[root.val]];
  }

  const subRes1 = pathSum(root.left, targetSum - root.val);
  const subRes2 = pathSum(root.right, targetSum - root.val);

  const res = [];
  subRes1.forEach((list) => {
    res.push([root.val, ...list]);
  });
  subRes2.forEach((list) => {
    res.push([root.val, ...list]);
  });
  return res;
};
// @lc code=end
