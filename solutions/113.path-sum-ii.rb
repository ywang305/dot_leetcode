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
# @param {Integer} target_sum
# @return {Integer[][]}
def path_sum(root, target_sum)
  ans = []
  tmp = []

  dfs = lambda do |node, target|
    return if node.nil?
    ans.push tmp.dup << node.val if node.val == target && node.left.nil? && node.right.nil?
    tmp.push node.val
    dfs.call(node.left, target - node.val)
    dfs.call(node.right, target - node.val)
    tmp.pop
  end

  dfs.call root, target_sum
  ans
end

# alternative
def path_sum(root, target_sum)
  return [] if root.nil?
  return [[root.val]] if root.val == target_sum && root.left.nil? && root.right.nil?

  path_sum(root.left, target_sum-root.val).map { [root.val] + _1 } + path_sum(root.right, target_sum-root.val).map { [root.val] + _1 }
end
