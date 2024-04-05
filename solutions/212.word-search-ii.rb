# @param {Character[][]} board
# @param {String[]} words
# @return {String[]}
def find_words(board, words)
  m = board.size
  n = board[0].size

  trie = Trie.new
  words.each {|word| trie.insert(word) }

  cur_word = ''
  ans = []
  visited = Set.new

  dfs = lambda do |x,y, node|
    return if [x<0, y<0, x==m, y==n].any? || visited.include?([x,y])

    c = board[x][y]
    return if node[c].nil?

    cur_word << c
    visited << [x,y]
    ans << cur_word.dup if node[c].is_end

    dfs.call(x-1, y, node[c])
    dfs.call(x+1, y, node[c])
    dfs.call(x, y-1, node[c])
    dfs.call(x, y+1, node[c])

    visited.delete([x,y])
    cur_word.chop!
  end

  (0...m).each do |i|
    (0...n).each do |j|
      dfs.call(i,j, trie)
    end
  end
  ans.uniq
end

class Trie
  attr_accessor :is_end
  def initialize
    @hash = {}
    @is_end = false
  end

  def []=(key,value)
    @hash[key]=value
  end
  def [](key)
    @hash[key]
  end

  def insert(word)
    node = self
    word.each_char do |c|
      node[c] ||= Trie.new
      node = node[c]
    end
    node.is_end = true
  end

  def starts_with(word)
    node = self
    word.each_char do |c|
      return false if node[c].nil?
      node = node[c]
    end
    true
  end

  def has(word)
    node = self
    word.each_char do |c|
      return false if node[c].nil?
      node = node[c]
    end
    node.is_end
  end
end

# @lc code=end

find_words([["a","a"]], ["aaa"])
