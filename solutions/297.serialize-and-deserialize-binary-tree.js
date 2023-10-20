/*
 * @lc app=leetcode id=297 lang=javascript
 *
 * [297] Serialize and Deserialize Binary Tree
 */

// @lc code=start
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
  const q = [root];
  const arr = [];
  while (q.length) {
    const cur = q.shift();
    arr.push(cur ? cur.val : "null");
    if (cur) {
      q.push(cur.left, cur.right);
    }
  }
  return arr.join(",");
};

/**
 * Decodes your encoded data to tree.
 *
 * @param {string} data
 * @return {TreeNode}
 */
var deserialize = function (data) {
  const arr = data.split(",");
  const val = arr.shift();
  let q = [val == "null" ? null : new TreeNode(val)];
  const root = q[0];
  while (arr.length) {
    const n = q.length;
    for (let i = 0; i < n; ++i) {
      //层序遍历
      if (q[i]) {
        const left = arr.shift();
        const right = arr.shift();
        q[i].left = left === "null" ? null : new TreeNode(left);
        q[i].right = right === "null" ? null : new TreeNode(right);
        q.push(q[i].left);
        q.push(q[i].right);
      }
    }
    q = q.slice(n);
  }

  return root;
};

/**
 * Your functions will be called as such:
 * deserialize(serialize(root));
 */
// @lc code=end
