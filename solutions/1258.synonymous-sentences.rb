# @param {String[][]} synonyms
# @param {String} text
# @return {String[]}
def generate_sentences(synonyms, text)
  ufo = UnionFind.new
  synonyms.each do |a, b|
    ufo.union(a, b)
  end

  text = text.split(' ')
  ans = []
  tmp = []
  dfs = lambda do |start|
    if start >= text.size
      ans << tmp.join(' ')
      return
    end
    word = text[start]
    if ufo.root.key?(word)
      word_root = ufo.find(word)
      synos = ufo.root.keys.filter { |key| word_root == ufo.find(key) }
      synos.each do |syn|
        tmp << syn
        dfs.call(start + 1)
        tmp.pop
      end
    else
      tmp << word
      dfs.call(start + 1)
      tmp.pop
    end
  end
  dfs.call(0)
  ans.sort
end

class UnionFind
  attr_reader :root

  def initialize
    @root = {}
  end

  def find(x)
    @root[x] ||= x
    return x if @root[x] == x

    find(@root[x])
  end

  def union(x, y)
    root_x = find(x)
    root_y = find(y)
    @root[root_y] = root_x unless root_x == root_y
  end
end
