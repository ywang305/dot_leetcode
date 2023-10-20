#
# @lc app=leetcode id=83 lang=ruby
#
# [83] Remove Duplicates from Sorted List
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
# @return {ListNode}
def delete_duplicates(head)
  return nil if head.nil?

  next_node = head.next
  next_node = next_node.next while head.val == next_node&.val
  head.next = delete_duplicates(next_node)
  head
end
# @lc code=end
