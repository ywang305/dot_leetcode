# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @return {Void} Do not return anything, modify head in-place instead.
def reorder_list(head)
  slow = head
  fast = head.next
  return if fast.nil? # handle only 1 elment, like [1]

  while fast&.next # split
    slow = slow.next
    fast = fast.next
    fast = fast&.next
  end

  second_head = slow.next
  slow.next = nil
  first_head = head
  second_head, _ = reverse(second_head) # reverse 2nd head

  merge(first_head, second_head) # merge two lists
end

def reverse(head)
  return [head, head] if head.next.nil?

  r_head, r_tail = reverse(head.next)
  r_tail.next = head
  head.next = nil
  [r_head, head]
end

def merge(h1, h2)
  return if h1.nil? || h2.nil?

  saved_h1_next = h1.next
  saved_h2_next = h2.next
  h1.next = h2
  h2.next = saved_h1_next
  merge(saved_h1_next, saved_h2_next)
end
