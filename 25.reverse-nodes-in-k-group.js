/*
 * @lc app=leetcode id=25 lang=javascript
 *
 * [25] Reverse Nodes in k-Group
 */

// @lc code=start
/**
 * Definition for singly-linked list.
 * function ListNode(val, next) {
 *     this.val = (val===undefined ? 0 : val)
 *     this.next = (next===undefined ? null : next)
 * }
 */
/**
 * @param {ListNode} head
 * @param {number} k
 * @return {ListNode}
 */
var reverseKGroup = function (head, k) {
  const nodes = [];
  for (let i = 0, cur = head; i < k && cur; ++i, cur = cur.next) {
    nodes.push(cur);
  }
  if (nodes.length < k) return head;
  const next = nodes.at(-1).next;
  nodes[0].next = reverseKGroup(next, k);
  nodes.forEach((cur, i) => {
    if (i > 0) cur.next = nodes[i - 1];
  });
  return nodes.at(-1);
};
// @lc code=end
