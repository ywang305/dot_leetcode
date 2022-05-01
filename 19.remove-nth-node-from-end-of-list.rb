#
# @lc app=leetcode id=19 lang=ruby
#
# [19] Remove Nth Node From End of List
#

# @lc code=start
# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @param {Integer} n
# @return {ListNode}
def remove_nth_from_end(head, n)
  dummy = ListNode.new(0, head)
  node = dummy.next
  len = 0
  while node
    len += 1
    node = node.next
  end
  n = len - n
  node = dummy
  while n.positive?
    node = node.next
    n -= 1
  end

  node.next = node.next.next
  dummy.next
end
# @lc code=end
