/*
 * @lc app=leetcode id=142 lang=javascript
 *
 * [142] Linked List Cycle II
 */

// @lc code=start
/**
 * Definition for singly-linked list.
 * function ListNode(val) {
 *     this.val = val;
 *     this.next = null;
 * }
 */

/**
 * @param {ListNode} head
 * @return {ListNode}
 */
var detectCycle = function (head, visited = new Set()) {
  if (!head) return null;
  if (visited.has(head)) return head;
  visited.add(head);
  return detectCycle(head.next, visited);
};
// @lc code=end
