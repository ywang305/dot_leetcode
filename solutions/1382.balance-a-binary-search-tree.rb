#
# @lc app=leetcode id=1382 lang=ruby
#
# [1382] Balance a Binary Search Tree
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
# @return {TreeNode}
def balance_bst(root)
  # Solution1.balance_bst(root)
  Solution2.balance_bst(root)
end

class Solution1
  # 中序遍历，取值排序，树重构
  def self.balance_bst(root)
    ordered_array = inorder(root)
    balance_tree(ordered_array, 0, ordered_array.length - 1)
  end

  # return [Array] ordered array
  def self.inorder(root)
    return [] if root.nil?
    inorder(root.left) + [root.val] + inorder(root.right)
  end

  # return [TreeNode]
  def self.balance_tree(array, first, last)
    return if first > last

    mid = first + (last - first) / 2
    TreeNode.new(array[mid], balance_tree(array, first, mid - 1), balance_tree(array, mid + 1, last))
  end
end

class Solution2
  # 真的在旋转🌲
  def self.balance_bst(root)
    return if root.nil?

    root.left = balance_bst(root.left)
    root.right = balance_bst(root.right)
    root_height_diff = height_diff(root)

    return root if root_height_diff.abs <= 1

    if root_height_diff > 1 # left is higher
      root.left = rotate_left(root.left) if height_diff(root.left) < 0 # 先左
      root = rotate_right(root) # 再右
    elsif root_height_diff < -1 # right is higher
      root.right = rotate_right(root.right) if height_diff(root.right) > 0 # 先右
      root = rotate_left(root) # 再左
    end
    balance_bst(root)
  end

  def self.rotate_left(root)
    new_root = root.right
    root.right = new_root.left
    new_root.left = root
    new_root
  end

  def self.rotate_right(root)
    new_root = root.left
    root.left = new_root.right
    new_root.right = root
    new_root
  end

  def self.height(root)
    return -1 if root.nil?
    [height(root.left), height(root.right)].max + 1
  end

  def self.height_diff(root)
    return 0 if root.nil?
    height(root.left) - height(root.right)
  end
end
# @lc code=end


# var balanceBST = function(root) {
#   if(!root) return root;

#   root.left = balanceBST(root.left);
#   root.right = balanceBST(root.right);
#   const dffH = dffHeight(root);
#   if( Math.abs(dffH)<=1) {
#       return root;
#   }

#   if(dffH>1) {
#       if( dffHeight(root.left)<0 ) {
#           root.left = rotL(root.left);
#       }
#       root = rotR(root);
#   } else if(dffH<-1) {
#       if( dffHeight(root.right>0)) {
#           root.right = rotR(root.right);
#       }
#       root = rotL(root);
#   }

#   return balanceBST(root);
# };

# function rotR(root) {
#   const mid = root.left;
#   root.left = mid.right;
#   mid.right = root;
#   return mid;
# }
# function rotL(root) {
#   const mid = root.right;
#   root.right = mid.left;
#   mid.left = root;
#   return mid;
# }
# function height(root) {
#   if(!root) return -1;
#   return Math.max(height(root.left), height(root.right)) + 1;
# }
# function dffHeight(root) {
#   if(!root) return 0;
#   return height(root.left) - height(root.right);
# }
