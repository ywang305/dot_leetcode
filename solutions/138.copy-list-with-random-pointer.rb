# Definition for Node.
# class Node
#     attr_accessor :val, :next, :random
#     def initialize(val = 0)
#         @val = val
#		  @next = nil
#		  @random = nil
#     end
# end

# @param {Node} node
# @return {Node}
def copyRandomList(head, memo={})
  return if head.nil?
  return memo[head] if memo.key? head

  Node.new(head.val).tap {
    memo[head] = _1
    _1.next = copyRandomList(head.next, memo)
    _1.random = copyRandomList(head.random, memo)
  }
end
