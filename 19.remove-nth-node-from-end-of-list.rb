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
  return [nil, 0] if head.nil?

  next_head, next_num = remove_nth_from_end(head.next, n)
  head.next = next_head
  if next_num
    cur_num = next_num + 1
    return next_head if cur_num == n

    return [head, cur_num]
  end

  head
end
# @lc code=end
