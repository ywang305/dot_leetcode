/**
 * Definition for a binary tree node.
 * function TreeNode(val) {
 *     this.val = val;
 *     this.left = this.right = null;
 * }
 */
/**
 * @param {TreeNode} root
 * @param {TreeNode} p
 * @param {TreeNode} q
 * @return {TreeNode}
 */
var lowestCommonAncestor = function (root, p, q) {
  if (!p || !q) return null;
  let ans = null;
  const dfs = (node) => {
    if (!node) return false;

    const l = dfs(node.left);
    const r = dfs(node.right);
    if (l && r) ans = node;
    if ((p === node || q === node) && (l || r)) ans = node;
    return l || r || node === p || node === q;
  };
  dfs(root);
  return ans;
};
