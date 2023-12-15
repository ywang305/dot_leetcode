# @param {Integer[]} gas
# @param {Integer[]} cost
# @return {Integer}
def can_complete_circuit(gas, cost)
  return -1 if gas.sum < cost.sum # total satisfication
  tank = 0
  res = -1
  gas.zip(cost).each.with_index do |(g, c), i|
    next_tank = max(tank + g - c, 0)
    res = i if next_tank >= 0 && tank == 0 # first time meets
    tank = next_tank
  end
  res
end

def max(*args) = args.max
