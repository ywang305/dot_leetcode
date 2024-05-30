# @param {Integer} n
# @return {Integer}
def count_digit_one(n)
  digit = 1
  res = 0
  high = n / 10
  cur = n % 10
  low = 0
  while high > 0 || cur > 0
    # https://leetcode.cn/problems/number-of-digit-one/solutions/1748815/by-baoya_uncle-2hnj/
    res += high * digit if cur == 0
    res += high * digit + low + 1 if cur == 1
    res += (high + 1) * digit if cur > 1

    low += cur * digit
    cur = high % 10
    high /= 10
    digit *= 10
  end
  res
end
