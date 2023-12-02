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
def max_path_sum(root)
  res = -2e31
  dfs = lambda do |node|
    return 0 if node.nil?
    left_sum = max(0, dfs.call(node.left))
    right_sum = max(0, dfs.call(node.right))
    res = max(res, node.val + left_sum + right_sum)
    node.val + max(left_sum, right_sum)
  end

  dfs.call(root)
  res
end

def max(*nums) = nums.max
