/*
 * @lc app=leetcode id=133 lang=javascript
 *
 * [133] Clone Graph
 */

// @lc code=start
/**
 * // Definition for a Node.
 * function Node(val, neighbors) {
 *    this.val = val === undefined ? 0 : val;
 *    this.neighbors = neighbors === undefined ? [] : neighbors;
 * };
 */

/**
 * @param {Node} node
 * @return {Node}
 */
var cloneGraph = function (node, m = new WeakMap()) {
  if (!node) return null;
  if (m.has(node)) return m.get(node);
  const cloneNode = new Node(node.val);
  m.set(node, cloneNode);
  node.neighbors.forEach((neighbor) =>
    cloneNode.neighbors.push(cloneGraph(neighbor, m))
  );
  return cloneNode;
};
// @lc code=end
