class WordDistance
  def initialize(words_dict)
    @hash = words_dict.each.with_index.each_with_object(Hash.new { |h, k| h[k] = [] }) do |(c, i), a|
      a[c] << i
      a
    end
  end

  def shortest(word1, word2)
    pos1, pos2 = @hash.values_at(word1, word2)
    i = j = 0
    ans = Float::INFINITY
    while i < pos1.size && j < pos2.size
      ans = [ans, (pos1[i] - pos2[j]).abs].min
      pos1[i] < pos2[j] ? (i += 1) : (j += 1)
    end
    while i < pos1.size
      ans = [ans, (pos1[i] - pos2[j - 1]).abs].min
      i += 1
    end
    while j < pos2.size
      ans = [ans, (pos1[i - 1] - pos2[j]).abs].min
      j += 1
    end
    ans
  end
end
