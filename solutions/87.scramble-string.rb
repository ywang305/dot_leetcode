# @param {String} s1
# @param {String} s2
# @return {Boolean}
def is_scramble(s1, s2)
  len = s1.length
  return s1 == s2 if len <= 1
  return $memo[[s1,s2]] if $memo.key? [s1,s2]

  ans = false
  (1...len).each do |i|
    break ans = true if (
      is_scramble(s1[...i], s2[...i]) && is_scramble(s1[i...], s2[i...])) ||
      (is_scramble(s1[...i], s2[len - i...]) && is_scramble(s1[i...], s2[...len - i])
    )
  end
  $memo[[s1,s2]] = ans
end

$memo = {}
