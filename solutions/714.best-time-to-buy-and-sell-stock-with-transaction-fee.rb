# @param {Integer[]} prices
# @param {Integer} fee
# @return {Integer}
def max_profit(prices, fee)
  hold = -prices[0]
  no_hold = 0
  prices.drop(1).each do |p|
    pre_hold = hold
    pre_no_hold = no_hold
    hold = max(pre_no_hold - p, pre_hold)
    no_hold = max(pre_no_hold, pre_hold + p - fee)
  end
  max(hold, no_hold)
end

def max(*vars) = vars.max
