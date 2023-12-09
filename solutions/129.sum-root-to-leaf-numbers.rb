# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @return {Integer}
def sum_numbers(root)
  res = 0
  tmp = ''
  pre_order = lambda do |node|
    tmp << node.val.to_s
    res += tmp.to_i if node.left.nil? && node.right.nil?
    pre_order.call(node.left) if node.left
    pre_order.call(node.right) if node.right
    tmp.chop!
  end
  pre_order.call(root)
  res
end
