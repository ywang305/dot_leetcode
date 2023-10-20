/*
 * @lc app=leetcode id=138 lang=javascript
 *
 * [138] Copy List with Random Pointer
 */

// @lc code=start
/**
 * // Definition for a Node.
 * function Node(val, next, random) {
 *    this.val = val;
 *    this.next = next;
 *    this.random = random;
 * };
 */

/**
 * @param {Node} head
 * @return {Node}
 */
var copyRandomList = function (head, m = new WeakMap()) {
  if (!head) return null;
  if (m.has(head)) return m.get(head);

  const clone = new Node(head.val);
  m.set(head, clone);
  clone.next = copyRandomList(head.next, m);
  clone.random = copyRandomList(head.random, m);
  return clone;
};
// @lc code=end
