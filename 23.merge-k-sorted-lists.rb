#
# @lc app=leetcode id=23 lang=ruby
#
# [23] Merge k Sorted Lists
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
# @param {ListNode[]} lists
# @return {ListNode}
def merge_k_lists(lists)
  merge2 = proc do |node1, node2|
    dummy = ListNode.new
    cur = dummy
    while node1 && node2
      if node1.val < node2.val
        cur.next = node1
        node1 = node1.next
      else
        cur.next = node2
        node2 = node2.next
      end
      cur = cur.next
    end
    cur.next = node1 || node2
    dummy.next
  end
  lists.unshift(merge2.call(lists.pop, lists.pop)) until lists.length == 1
  lists[0]
end
# @lc code=end

