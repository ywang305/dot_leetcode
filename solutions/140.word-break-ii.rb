# @param {String} s
# @param {String[]} word_dict
# @return {String[]}
def word_break(s, word_dict)
  res = []
  tmp = []
  dfs = lambda do |starter|
    res << tmp.join(' ') if starter == s.size
    (starter...s.size).each do |ender|
      sub_str = s[starter..ender]
      if word_dict.include?(sub_str)
        tmp << sub_str
        dfs.call(ender+1)
        tmp.pop
      end
    end
  end
  dfs.call(0)
  res
end
