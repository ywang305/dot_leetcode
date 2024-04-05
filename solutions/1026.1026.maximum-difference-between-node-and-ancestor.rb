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
def max_ancestor_diff(root, minmax=[])
  return 0 if root.nil?

  next_minmax = [min(root.val, *minmax), max(root.val, *minmax)]
  left_ans = max_ancestor_diff(root.left, next_minmax)
  right_ans = max_ancestor_diff(root.right, next_minmax)
  cur_ans = max(*next_minmax.map{ (_1 - root.val).abs })
  max(left_ans, right_ans, cur_ans)
end

def min(*vals) = vals.min
def max(*vals) = vals.max
