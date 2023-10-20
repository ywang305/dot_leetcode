/**
 * 这题不能用直接递归，
只能用 helper DFS function
因为 DFS 返回值 和 res 是无关联的
 */

var maxPathSum = function (root) {
  let res = -Infinity;
  const DFS = (node) => {
    if (!node) return 0;
    let left = Math.max(DFS(node.left), 0);
    let right = Math.max(DFS(node.right), 0);
    res = Math.max(res, left + right + node.val); // 记录一个完整的路径
    return Math.max(left, right) + node.val; // 构成当前的最大值 返回
  };
  DFS(root);
  return res;
};
