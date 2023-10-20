#
# @lc app=leetcode id=572 lang=ruby
#
# [572] Subtree of Another Tree
#

# @lc code=start
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
# @param {TreeNode} sub_root
# @return {Boolean}
def is_subtree(root, sub_root)
    def is_same(node, node2)
      return true if node.nil? && node2.nil?
      return false if node.nil? || node2.nil?
      node.val == node2.val && is_same(node.left, node2.left) && is_same(node.right, node2.right)
    end

    return true if root.nil? && sub_root.nil?
    return false if root.nil? || sub_root.nil?
    is_same(root, sub_root) || is_subtree(root.left, sub_root) || is_subtree(root.right, sub_root)
end
# @lc code=end

