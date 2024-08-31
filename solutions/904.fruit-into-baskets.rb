# @param {Integer[]} fruits
# @return {Integer}
def total_fruit(fruits)
  hash = Hash.new { |h, k| h[k] = 0 }
  ans = 0
  i = 0
  fruits.each.with_index do |_f, j|
    hash[fruits[j]] += 1
    while hash.size > 2
      key = fruits[i]
      hash[key] -= 1
      hash.delete(key) if hash[key] == 0
      i += 1
    end
    ans = max(j - i + 1, ans)
  end
  ans
end

def max(*vars)=vars.max
