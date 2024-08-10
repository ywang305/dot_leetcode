# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {ListNode} head
# @return {TreeNode}
def sorted_list_to_bst(head)
  return if head.nil?

  pre = nil
  slow = head
  fast = head
  until fast&.next.nil?
    pre = slow
    slow = slow.next
    fast = fast.next&.next
  end
  head2 = slow.next
  pre&.next = nil
  p "pre=#{pre&.val}, slow=#{slow&.val}, fast=#{fast&.val}"
  root = TreeNode.new(slow.val, pre ? sorted_list_to_bst(head) : nil, sorted_list_to_bst(head2))
end
