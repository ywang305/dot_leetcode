# @param {String} s
# @param {String} t
# @return {String}
def min_window(s, t)
  need_tally = t.chars.tally
  need_key_type = need_tally.keys.length

  left = right = nil
  ans = ''

  s.each_char.with_index do |c, i|
    if need_tally.key? c
      left ||= i
      right = i

      need_tally[c] -= 1
      need_key_type -= 1 if need_tally[c].zero?

      while need_key_type.zero?
        left_c = s[left]
        if need_tally.key? left_c
          substr = s[left..right]
          ans = substr if ans.empty? || substr.length < ans.length
          need_key_type += 1 if (need_tally[left_c] += 1) == 1
        end
        left += 1
      end
    end
  end
  ans
end
