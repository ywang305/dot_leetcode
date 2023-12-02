# Definition for a Node.
# class Node
#     attr_accessor :val, :left, :right, :next
#     def initialize(val)
#         @val = val
#         @left, @right, @next = nil, nil, nil
#     end
# end

# @param {Node} root
# @return {Node}
def connect(root)
  q = [root]
  while q.any?
    level = []
    (0...q.length).each do
      cur = q.shift
      q << cur.left if cur.left
      q << cur.right if cur.right
      level.last.next = cur if level.last
      level << cur
    end
  end
  root
end
