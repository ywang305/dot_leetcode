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
# @return {Integer[]}
def find_mode(root)
  ans = []
  pre = nil
  count = 0
  max_count = 0

  inorder = lambda do |cur|
    return if cur.nil?

    inorder.call(cur.left)
    if pre.nil?
      count = 1
    elsif pre.val == cur.val
      count += 1
    else
      count = 1
    end

    ans << cur.val if max_count == count
    if count > max_count
      ans = [] << cur.val
      max_count = count
    end

    pre = cur
    inorder.call(cur.right)
  end

  inorder.call(root)
  ans
end
