/*
 * @lc app=leetcode id=134 lang=javascript
 *
 * [134] Gas Station
 */

// @lc code=start
/**
 * @param {number[]} gas
 * @param {number[]} cost
 * @return {number}
 */
var canCompleteCircuit = function (gas, cost) {
  let remain = 0; // total remain as all_gas - all_cost
  let tank = 0;
  let start = 0;
  for (let i = 0; i < gas.length; i++) {
    remain += gas[i] - cost[i];
    tank += gas[i] - cost[i];
    if (tank < 0) {
      start = i + 1;
      tank = 0;
    }
  }
  return remain >= 0 ? start : -1; // 贪婪， 因为此题条件给定仅唯一解
};
// @lc code=end
