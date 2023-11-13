# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @param {Integer} left
# @param {Integer} right
# @return {ListNode}
def reverse_between(head, left, right)
  return head if right == 1

  if left <= 1
    cur_next = head.next
    rev_head = reverse_between(cur_next, left-1, right-1)
    head.next = cur_next.next # head 和 next 反过来
    cur_next.next = head  # head 放到尾
    return rev_head
  end


  head.next = reverse_between(head.next, left-1, right-1)
  return head
end
