# @param {String} s
# @return {Integer}
def length_of_longest_substring_two_distinct(s)
  hash = Hash.new { |h, k| h[k] = 0 }
  l = 0
  ans = 0
  (0...s.size).each do |r|
    cur = s[r]
    hash[cur] += 1
    while hash.size > 2
      pre = s[l]
      hash[pre] -= 1
      hash.delete(pre) if hash[pre] == 0
      l += 1
    end
    ans = max(ans, r - l + 1)
  end
  ans
end

def max(*vars)=vars.max
