# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
  hold = -prices[0]
  no_hold = 0

  prices.drop(1).each do |p|
    pre_hold, pre_no_hold = hold, no_hold
    hold = [pre_no_hold - p, pre_hold].max
    no_hold = [pre_no_hold, pre_hold + p].max
  end
  [hold, no_hold].max
end
