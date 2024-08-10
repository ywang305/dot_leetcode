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
def largest_bst_subtree(root)
  inf = 1 << 31
  dfs = lambda do |node|
    return [true, inf, -inf, 0] if node.nil?

    l_valid, l_min, l_max, l_cnt = dfs.call(node.left)
    r_valid, r_min, r_max, r_cnt = dfs.call(node.right)

    val = node.val
    valid = l_valid && r_valid && val > l_max && val < r_min
    if valid
      [true, l_min == inf ? val : l_min, r_max == -inf ? val : r_max, l_cnt + r_cnt + 1]
    else
      [false, l_min, r_max, max(l_cnt, r_cnt)]
    end
  end

  ans = dfs.call(root)
  ans.last
end

def max(*vars)=vars.max
