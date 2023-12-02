# @param {String} begin_word
# @param {String} end_word
# @param {String[]} word_list
# @return {String[][]}
def find_ladders(begin_word, end_word, word_list)
  dict = Set.new(word_list)
  return [] unless dict.include? end_word

  q = [begin_word]
  dict.delete begin_word
  graph = Hash.new {|h,k| h[k]=[]}
  until q.empty? # BFS
    break if q.include? end_word

    q.size.times do
      word = q.shift
      [*'a'..'z'].product([*0...word.size]).each do |c, i|
        new_word = word.dup.tap {|w| w[i]=c }
        if new_word != word && dict.include?(new_word)
          q << new_word
          graph[new_word] << word  # 注意 图记方向：后层->前层， 方便DFS能从end_word索索到begin_word
          break if new_word == end_word # 减小图空间
        end
      end
    end
    q.uniq!
    q.each { dict.delete _1 }
  end

  res = []
  temp = []
  dfs = lambda do |cur|
    return res << temp.dup if cur == begin_word

    graph[cur].each do |nei|
      temp.unshift nei
      dfs.call(nei)
      temp.shift
    end
  end

  temp << end_word
  dfs.call(end_word) # DFS 反向搜索

  res
end
