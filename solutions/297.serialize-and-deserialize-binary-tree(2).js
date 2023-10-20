/**
 * Definition for a binary tree node.
 * function TreeNode(val) {
 *     this.val = val;
 *     this.left = this.right = null;
 * }
 */

/**
 * Encodes a tree to a single string.
 *
 * @param {TreeNode} root
 * @return {string}
 */
var serialize = function (root) {
  const m = {};

  const preOrder = (node) => {
    if (!node) return "";
    const left = preOrder(node.left);
    const right = preOrder(node.right);
    const { val } = node;
    m[val] = (m[val] ?? -1) + 1;
    node.val = node.val + "." + m[val]; // the duplicate value will fail the algorithm, so it is differentiated by adding decimal
    return node.val + (left ? "," : "") + left + (right ? "," : "") + right;
  };
  const inOrder = (node) => {
    if (!node) return "";
    const left = inOrder(node.left);
    const right = inOrder(node.right);
    return left + (left ? "," : "") + node.val + (right ? "," : "") + right;
  };

  return preOrder(root) + "\n" + inOrder(root);
};

/**
 * Decodes your encoded data to tree.
 *
 * @param {string} data
 * @return {TreeNode}
 */
var deserialize = function (data) {
  const [preArr, inArr] = data.split("\n").map((str) => str.split(","));
  const dfs = (preArr, inArr) => {
    const firstVal = preArr[0];
    if (!firstVal) return null;

    const pos = inArr.findIndex((v) => v == firstVal);
    const left = dfs(preArr.slice(1, pos + 1), inArr.slice(0, pos));
    const right = dfs(preArr.slice(pos + 1), inArr.slice(pos + 1));
    const root = new TreeNode(parseInt(firstVal)); // remember value is decimal
    root.left = left;
    root.right = right;
    return root;
  };

  return dfs(preArr, inArr);
};

/**
 * Your functions will be called as such:
 * deserialize(serialize(root));
 */
