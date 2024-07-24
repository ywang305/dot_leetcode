# @param {String[]} words_dict
# @param {String} word1
# @param {String} word2
# @return {Integer}
def shortest_word_distance(words_dict, word1, word2)
  hash = words_dict.each.with_index.each_with_object(Hash.new { |h, k| h[k] = [] }) do |(c, i), a|
    a[c] << i
  end
  i = 0
  j = 0
  ans = Float::INFINITY
  positions1 = hash[word1]
  positions2 = hash[word2]
  while i < positions1.size && j < positions2.size
    pos1 = positions1[i]
    pos2 = positions2[j]

    ans = [ans, (pos1 - pos2).abs].min if pos1 != pos2

    if pos1 <= pos2
      i += 1
    else
      j += 1
    end
  end

  while i < positions1.size
    ans = [ans, (positions1[i] - positions2[j - 1]).abs].min if i != j - 1
    i += 1
  end
  while j < positions2.size
    ans = [ans, (positions2[j] - positions1[i - 1]).abs].min if j != i - 1
    j += 1
  end
  ans
end
