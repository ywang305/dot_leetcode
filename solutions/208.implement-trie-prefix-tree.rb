class Trie
  attr_accessor :is_end

  def initialize()
    @hash={}
    @is_end = false
  end

  def [](key) = @hash[key]

  def []=(key, value)
    @hash[key] = value
  end

=begin
  :type word: String
  :rtype: Void
=end
  def insert(word)
    node = self
    word.chars.each do |c|
      node[c] ||= Trie.new
      node = node[c]
    end
    node.is_end = true
  end


=begin
  :type word: String
  :rtype: Boolean
=end
  def search(word)
    node = self
    word.chars.each do |c|
      return false unless node[c]
      node = node[c]
    end
    node.is_end
  end


=begin
  :type prefix: String
  :rtype: Boolean
=end
  def starts_with(prefix)
    node = self
    prefix.chars.each do |c|
      return false if node[c].nil?
      node = node[c]
    end
    true
  end
end

# Your Trie object will be instantiated and called as such:
# obj = Trie.new()
# obj.insert(word)
# param_2 = obj.search(word)
# param_3 = obj.starts_with(prefix)
