/*
 * @lc app=leetcode id=23 lang=javascript
 *
 * [23] Merge k Sorted Lists
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
 * @param {ListNode[]} lists
 * @return {ListNode}
 */
var mergeKLists = function (lists) {
  const merge2 = (node1, node2) => {
    const dummy = new ListNode();
    let cur = dummy;
    while (node1 && node2) {
      if (node1.val < node2.val) {
        cur.next = node1;
        node1 = node1.next;
      } else {
        cur.next = node2;
        node2 = node2.next;
      }
      cur = cur.next;
    }
    cur.next = node1 || node2;
    return dummy.next;
  };

  while (lists.length > 1) {
    const newLists = [];
    for (let i = 0; i < lists.length; i += 2) {
      newLists.push(merge2(lists[i], lists[i + 1]));
    }
    lists = newLists;
  }

  return lists[0] ?? null;
};
// @lc code=end
