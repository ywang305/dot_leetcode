# @param {Integer[]} ratings
# @return {Integer}
def candy(ratings)
  len = ratings.length
  candies = Array.new(len) {1}
  (1...len).each do |i|
    candies[i] = candies[i-1]+1 if ratings[i] > ratings[i-1]
  end
  (len-2).downto(0) do |i|
    candies[i] = max(candies[i], candies[i+1]+1) if ratings[i] > ratings[i+1]
  end
  candies.sum
end

def max(*args) = args.max
