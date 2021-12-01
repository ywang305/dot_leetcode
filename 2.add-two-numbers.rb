#
# @lc app=leetcode id=2 lang=ruby
#
# [2] Add Two Numbers
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
# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def add_two_numbers(l1, l2)
  return l2 if l1.nil?
  return l1 if l2.nil?

  head = ListNode.new(0)
  cur = head
  carry = 0
  while l1 || l2
    sum = (l1&.val || 0) + (l2&.val || 0) + carry
    carry = sum / 10
    cur.next = ListNode.new(sum % 10)
    cur = cur.next
    l1 = l1&.next
    l2 = l2&.next
  end
  cur.next = ListNode.new(carry) if carry.positive?
  head.next
end
# @lc code=end
