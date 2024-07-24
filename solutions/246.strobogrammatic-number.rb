# @param {String} num
# @return {Boolean}
def is_strobogrammatic(num)
  match = { '1' => '1', '0' => '0', '8' => '8', '6' => '9', '9' => '6' }

  n = num.size
  (n - 1).downto(n / 2) do |i|
    c = num[i]
    return false unless match.key? c
    return false unless num[n - i - 1] == match[c]
  end

  true
end
