# @param {Character[]} s
# @return {Void} Do not return anything, modify s in-place instead.
def reverse_words(s)
  swap = lambda do |i, j|
    while i < j
      s[i], s[j] = s[j], s[i]
      i += 1
      j -= 1
    end
  end

  swap.call(0, s.size - 1)

  i = 0
  (0..s.size).each do |j|
    if s[j] === ' ' || j === s.size
      swap.call(i, j - 1)
      i = j + 1
    end
  end
end
