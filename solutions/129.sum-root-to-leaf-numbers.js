/*
 * @lc app=leetcode id=129 lang=javascript
 *
 * [129] Sum Root to Leaf Numbers
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
 * @return {number}
 */
var sumNumbers = function (root, isRoot = true) {
  if (!root) return [];
  const left = sumNumbers(root.left, false);
  const right = sumNumbers(root.right, false);
  const res = [
    ...left.map((n) => String(root.val) + n),
    ...right.map((n) => String(root.val) + n),
  ];
  if (!res.length) res.push(String(root.val));
  return isRoot ? res.reduce((a, c) => a + Number(c), 0) : res;
};
// @lc code=end
