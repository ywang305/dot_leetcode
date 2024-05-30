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
# @param {Integer} k
# @return {Integer}
def kth_smallest(root, k, c=[0])
  return 0 if root.nil?

  left = kth_smallest(root.left, k, c)
  return left if left > 0
  c[0] += 1
  return root.val if c[0] == k
  return kth_smallest(root.right, k, c)
end
