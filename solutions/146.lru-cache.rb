class LRUCache
  # double ended circluar queue
  class Node
    attr_accessor :key, :value, :pre, :nex

    def initialize(key, value, pre = nil, nex = nil)
      @key = key
      @value = value
      @pre = pre
      @nex = nex
    end
  end

  #   :type capacity: Integer
  def initialize(capacity)
    @capacity = capacity
    @key_to_node = {}
    @dummy = Node.new(-1, -1)
    @dummy.pre = @dummy.nex = @dummy
  end

  #   :type key: Integer
  #   :rtype: Integer
  def get(key)
    node = @key_to_node.dig(key)
    return -1 if node.nil?

    delete(node)
    insert(node)
    node.value
  end

  #   :type key: Integer
  #   :type value: Integer
  #   :rtype: Void
  def put(key, value)
    if @key_to_node.key?(key)
      node = @key_to_node[key]
      node.value = value
      delete(node)
      insert(node)
    else
      node = Node.new(key, value)
      @key_to_node[key] = node
      insert(node)
    end

    return unless @key_to_node.size > @capacity

    last_node = @dummy.pre
    delete(last_node)
    @key_to_node.delete(last_node.key)
  end

  private

  def insert(node)
    head_nex = @dummy.nex
    node.nex = head_nex
    head_nex.pre = node
    @dummy.nex = node
    node.pre = @dummy
  end

  def delete(node)
    node_pre = node.pre
    node_nex = node.nex
    node_pre.nex = node_nex
    node_nex.pre = node_pre
    node.pre = node.nex = nil
  end
end

# Your LRUCache object will be instantiated and called as such:
# obj = LRUCache.new(capacity)
# param_1 = obj.get(key)
# obj.put(key, value)
