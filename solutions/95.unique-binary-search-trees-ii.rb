# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {Integer} n
# @return {TreeNode[]}
def generate_trees(n, left=1, right=n)
  ans = []
  return ans << nil if left > right
  return ans << TreeNode.new(left) if left == right

  (left..right).each do |cur|
    left_child_roots = generate_trees(n, left, cur-1)
    right_child_roots = generate_trees(n, cur+1, right)
    left_child_roots.each do |l|
      right_child_roots.each do |r|
        ans << TreeNode.new(cur, l, r)
      end
    end
  end

  ans
end
