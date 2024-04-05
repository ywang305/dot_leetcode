class WordDictionary
  attr_accessor :is_end
  attr_reader :hash

  def [](key) = @hash[key]

  def []=(key, value)
    @hash[key] = value
  end

  def initialize()
    @hash = {}
    @is_end = false
  end


=begin
  :type word: String
  :rtype: Void
=end
  def add_word(word)
    node = self
    word.chars.each do |c|
      node[c] ||= WordDictionary.new
      node = node[c]
    end
    node.is_end = true
  end


=begin
  :type word: String
  :rtype: Boolean
=end
  def search(word, start=0)
    node = self
    (start...word.size).each do |i|
      c = word[i]
      if c=='.'
        node.hash.each_value do |next_node|
          return true if next_node.search(word, i+1)
        end
        return false
      end
      return false if node[c].nil?
      node = node[c]
    end
    node.is_end
  end
end
