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
# @return {TreeNode[]}
def find_duplicate_subtrees(root)
  ans = []
  freq = Hash.new { |h, k| h[k] = 0 }
  dfs = lambda do |cur|
    return [nil] if cur.nil?

    finger_print = [cur.val, *dfs.call(cur.left), *dfs.call(cur.right)]
    ans << cur if freq[finger_print] == 1
    freq[finger_print] += 1
    finger_print
  end
  dfs.call(root)
  ans
end
