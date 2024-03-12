# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
class BSTIterator
  attr_accessor :stack

  #   :type root: TreeNode
  def initialize(root)
    @stack = []
    until root.nil?
      @stack << root
      root = root.left
    end
  end

  #   :rtype: Integer
  def next
    node = stack.pop
    val = node.val
    node = node.right
    until node.nil?
      stack << node
      node = node.left
    end
    val
  end

  #   :rtype: Boolean
  def has_next
    !stack.empty?
  end
end

# Your BSTIterator object will be instantiated and called as such:
# obj = BSTIterator.new(root)
# param_1 = obj.next()
# param_2 = obj.has_next()
