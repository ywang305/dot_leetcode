/**
 * Definition for a binary tree node.
 * function TreeNode(val, left, right) {
 *     this.val = (val===undefined ? 0 : val)
 *     this.left = (left===undefined ? null : left)
 *     this.right = (right===undefined ? null : right)
 * }
 */
// @lc code=start
/**
 * @param {TreeNode} root
 * @return {TreeNode}
 */
var upsideDownBinaryTree = function (root) {
  if (!root || !root.left) return root;

  const newRoot = upsideDownBinaryTree(root.left);
  root.left.right = root;
  root.left.left = root.right;

  root.left = root.right = null;
  return newRoot;
};
// @lc code=end
