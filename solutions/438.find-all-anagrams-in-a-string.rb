# @param {String} s
# @param {String} p
# @return {Integer[]}
def find_anagrams(s, p)
  p_freqs = begin
      freqs = [0]*26
      p.bytes.each { freqs[_1-97]+=1 }
      freqs
  end

  win = [0]*26
  left = 0
  ans = []
  s.chars.each.with_index do |c, right|
      win[c.ord-97]+=1
      if right-left+1 == p.size
          ans << left if win==p_freqs
          win[s[left].ord-97]-=1
          left+=1
      end
  end
  ans
end
