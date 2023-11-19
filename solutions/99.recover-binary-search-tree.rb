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
# @return {Void} Do not return anything, modify root in-place instead.
def recover_tree(root, alpha=nil, beta=nil)
  return if root.nil?
  return swap_value(root, alpha) if alpha && alpha.val >= root.val
  return swap_value(root, beta) if beta && beta.val <= root.val

  saved_val = root.val
  recover_tree(root.left, alpha, root)
  recover_tree(root.right, root, beta)
  # 以上只保证了root和子节点的上下顺序，不能保证 left/right之间的顺序 （e.g. [2,3,1] 需要交换3和1)
  recover_tree(root, alpha, beta) if saved_val != root.val # keypoint: 再来一次
end

def swap_value(node_a, node_b)
  node_a.val, node_b.val = node_b.val, node_a.val
end
