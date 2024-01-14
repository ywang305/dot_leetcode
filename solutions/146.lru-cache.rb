class LRUCache
  # =begin
  #     :type capacity: Integer
  # =end
  def initialize(capacity)
    @capacity = capacity
    @key_to_node = {}
    @dummy = Node.new(-1, -1)
    @dummy.next = @dummy.prev = @dummy
  end

  # =begin
  #     :type key: Integer
  #     :rtype: Integer
  # =end
  def get(key)
    get_node(key)&.value || -1
  end

  # =begin
  #     :type key: Integer
  #     :type value: Integer
  #     :rtype: Void
  # =end
  def put(key, value)
    node = get_node(key)
    if node.nil?
      node = Node.new(key, value)
      insert(node)
    end
    node.value = value
    remove(@dummy.prev) if @key_to_node.size > @capacity
  end

  private

  def get_node(key)
    return nil unless @key_to_node.key? key

    node = @key_to_node[key]
    remove(node)
    insert(node)
    node
  end

  def remove(node)
    next_node = node.next
    prev_node = node.prev
    prev_node.next = next_node
    next_node.prev = prev_node
    node.next = node.prev = nil
    @key_to_node.delete(node.key) # returns the deleted node
  end

  # insert new node to front
  def insert(node)
    next_node = @dummy.next
    next_node.prev = node
    node.next = next_node
    @dummy.next = node
    node.prev = @dummy
    @key_to_node[node.key] = node
  end
end

# Double Linke Node
class Node
  attr_accessor :key, :value, :prev, :next

  def initialize(key, value, pre = nil, nex = nil)
    @key = key
    @value = value
    @prev = pre
    @next = nex
  end
end

# Your LRUCache object will be instantiated and called as such:
# obj = LRUCache.new(capacity)
# param_1 = obj.get(key)
# obj.put(key, value)
