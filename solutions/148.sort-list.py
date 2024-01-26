# Definition for singly-linked list.
class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next
from typing import Optional


class Solution:
    def sortList(self, head: Optional[ListNode]) -> Optional[ListNode]:
        if not head or not head.next: return head

        slow, fast = head, head.next
        while fast and fast.next:
            slow = slow.next
            fast = fast.next.next
        head2 = slow.next
        slow.next = None

        h1, h2 = self.sortList(head), self.sortList(head2)
        dum = ListNode()
        cur = dum
        while h1 and h2:
            if h1.val < h2.val:
                cur.next = h1
                h1 = h1.next
            else:
                cur.next = h2
                h2 = h2.next
            cur = cur.next
        cur.next = h1 or h2
        return dum.next
# @lc code=end

# test case
head = ListNode(4, ListNode(2, ListNode(1, ListNode(3))))
sorted_head = Solution().sortList(head)
while sorted_head:
    print(sorted_head.val)
    sorted_head = sorted_head.next
