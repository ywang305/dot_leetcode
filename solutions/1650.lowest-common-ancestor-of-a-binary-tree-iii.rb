# Definition for a Node.
# class Node
#     attr_accessor :val, :left, :right, :parent
#     def initialize(val=0)
#         @val = val
#         @left, @right, parent = nil, nil, nil
#     end
# end

# @param {Node} root
# @return {Node}
def lowest_common_ancestor(p, q)
  cur_p = p
  cur_q = q
  while cur_p != cur_q
    cur_p = cur_p ? cur_p.parent : q
    cur_q = cur_q ? cur_q.parent : p
  end
  cur_p
end
