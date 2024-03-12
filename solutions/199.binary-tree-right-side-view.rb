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
# @return {Integer[]}
def right_side_view(root)
  ans = []
  pre_order = lambda do |node, level=0|
    return if node.nil?
    ans[level] = node.val
    pre_order.call(node.left, level+1)
    pre_order.call(node.right, level+1)
  end

  pre_order.call(root)
  ans
end
