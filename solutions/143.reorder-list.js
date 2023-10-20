/*
 * @lc app=leetcode id=143 lang=javascript
 *
 * [143] Reorder List
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
 * @return {void} Do not return anything, modify head in-place instead.
 */
var reorderList = function (head) {
  let p = head;
  const arr = [];
  while (p) {
    arr.push(p);
    p = p.next;
  }
  for (let l = 0, r = arr.length - 1; l < r; ++l, --r) {
    arr[l].next = arr[r];
    arr[r].next = arr[l + 1];
    arr[l + 1].next = null;
  }
};
// @lc code=end
