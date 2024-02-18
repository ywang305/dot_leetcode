# @param {Integer} numerator
# @param {Integer} denominator
# @return {String}
def fraction_to_decimal(numerator, denominator)
  a, b = numerator, denominator
  return (a/b).to_s if a%b == 0
  ans = ''
  ans += '-' if a*b < 0
  a, b = [a, b].map(&:abs)
  ans += (a/b).to_s + '.'

  a %= b
  hash = {}
  while a != 0
    if hash.key?(a)
      index = hash[a]
      return "#{ans[...index]}(#{ans[index...]})"
    end
    hash[a] = ans.length
    a *= 10
    ans += (a/b).to_s
    a %= b
  end
  ans
end


fraction_to_decimal(1, 2)
