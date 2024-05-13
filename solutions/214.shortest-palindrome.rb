# @param {String} s
# @return {String}
def shortest_palindrome(s)
  s1 = s.dup
  s2 = s.reverse
  s.size.times do |i|
    break if s1 == s2
    s1[-1] = s2[0] = ''
  end
  possibles[s1.size...].reverse + s
end

shortest_palindrome('banana') # ans = 'ananabanana'
