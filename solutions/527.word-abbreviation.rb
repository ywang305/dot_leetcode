# @param {String[]} words
# @return {String[]}
def words_abbreviation(words)
  tr = Hash.new { |h, k| h[k] = Trie.new } # 所有单词按照长度与末尾字母做分组，对每组构造一个能统计节点频数的字典树
  words.each { |word| tr[[word.size, word[-1]]].insert(word) }
  ans = []
  words.each do |word|
    need = tr[[word.size, word[-1]]].uniq(word)
    ans << (need < word.size - 2 ? word[0...need] + String(word.size - need - 1) + word[-1] : word)
  end
  ans
end

class Trie
  attr_accessor :is_end, :freq

  def initialize
    @hash = {}
    @freq = 0
  end

  def [](key) = @hash[key]

  def []=(key, value)
    @hash[key] = value
  end

  def insert(word)
    node = self
    word.each_char do |c|
      node[c] ||= Trie.new
      node = node[c]
      node.freq += 1 # 只要有单词插入，路过的所有节点频数都要+1
    end
    node.is_end = true
  end

  def uniq(word)
    node = self
    cnt = 0
    word.each_char do |c|
      cnt += 1
      node = node[c]
      return cnt if node.freq == 1 # 找到了能够区分这个单词的前缀
    end
    word.size
  end
end
