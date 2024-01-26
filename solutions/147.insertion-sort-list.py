# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def remove_after(self, pre):
        cur = pre.next
        pre.next = cur.next
        return cur
    def insert_after(self, pre, node):
        node.next = pre.next
        pre.next = node

    def insertionSortList(self, head: Optional[ListNode]) -> Optional[ListNode]:
        dum = ListNode(next = head)
        cur = head
        while cur and cur.next:
            if cur.val <= cur.next.val:
                cur = cur.next
            else:
                tmp = self.remove_after(cur)
                prev = dum
                while prev.next.val <= tmp.val:
                    prev = prev.next
                self.insert_after(prev, tmp)
        return dum.next
