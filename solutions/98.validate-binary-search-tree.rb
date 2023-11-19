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
# @return {Boolean}
def is_valid_bst(root, left_val=nil, right_val=nil)
  return true if root.nil?
  return false if left_val && root.val <= left_val
  return false if right_val && root.val >= right_val
  is_valid_bst(root.left, left_val, root.val) && is_valid_bst(root.right, root.val, right_val)
end
