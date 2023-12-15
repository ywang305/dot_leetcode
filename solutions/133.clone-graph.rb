# Definition for a Node.
# class Node
#     attr_accessor :val, :neighbors
#     def initialize(val = 0, neighbors = nil)
#		  @val = val
#		  neighbors = [] if neighbors.nil?
#         @neighbors = neighbors
#     end
# end

# @param {Node} node
# @return {Node}
def cloneGraph(node, memo={})
  return if node.nil?

  unless memo.key? node
    memo[node] = Node.new(node.val)
    node.neighbors.each { |nei| memo[node].neighbors << cloneGraph(nei, memo) }
  end
  memo[node]
end
