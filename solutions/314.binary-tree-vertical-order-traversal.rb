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
# @return {Integer[][]}
def vertical_order(root, col=0, row=0, memo=Hash.new)
  return [] if root.nil?
  vertical_order(root.left, col-1, row+1, memo)
  vertical_order(root.right, col+1, row+1, memo)
  memo[col] ||= {}
  (memo[col][row] ||= []) << root.val
  memo.sort.map{|(_,cols)| cols.sort.flat_map{_1[1]} } if row.zero? #  先列排序，再行排序
end