/*
 * @lc app=leetcode id=173 lang=javascript
 *
 * [173] Binary Search Tree Iterator
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
 */
var BSTIterator = function (root) {
  this.vals = [];
  const inOrder = (node) => {
    if (!node) return;
    inOrder(node.left);
    this.vals.push(node.val);
    inOrder(node.right);
  };
  inOrder(root);
};

/**
 * @return {number}
 */
BSTIterator.prototype.next = function () {
  return this.vals.shift();
};

/**
 * @return {boolean}
 */
BSTIterator.prototype.hasNext = function () {
  return this.vals.length > 0;
};

/**
 * Your BSTIterator object will be instantiated and called as such:
 * var obj = new BSTIterator(root)
 * var param_1 = obj.next()
 * var param_2 = obj.hasNext()
 */
// @lc code=end
