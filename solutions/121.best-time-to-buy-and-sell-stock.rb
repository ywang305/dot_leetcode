# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
  ans, min_price = 0, 2e31
  prices.each do |price|
    min_price = [min_price, price].min
    ans = [ans, price - min_price].max
  end
  ans
end
