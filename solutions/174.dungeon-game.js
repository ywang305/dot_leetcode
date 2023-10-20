/*
 * @lc app=leetcode id=174 lang=javascript
 *
 * [174] Dungeon Game
 */

// @lc code=start
/**
 * @param {number[][]} dungeon
 * @return {number}
 */
var calculateMinimumHP = function (dungeon) {
  const m = dungeon.length,
    n = dungeon[0].length;
  const dp = Array.from({ length: m }, () =>
    Array.from({ length: n }, () => 0)
  );
  for (let i = m - 1; i >= 0; --i) {
    for (let j = n - 1; j >= 0; --j) {
      let cur;
      if (i === m - 1 && j === n - 1) {
        cur = dungeon[i][j];
      } else if (i === m - 1) {
        cur = dungeon[i][j] + dp[i][j + 1];
      } else if (j === n - 1) {
        cur = dungeon[i][j] + dp[i + 1][j];
      } else {
        cur = Math.max(dp[i + 1][j], dp[i][j + 1]) + dungeon[i][j];
      }
      dp[i][j] = cur > 0 ? 0 : cur;
    }
  }
  return -dp[0][0] + 1;
};
// @lc code=end
/*【思路】
  -10,   1
   30,   -5

  从终点 -5 往起点-10 逆推， 先分别 向上/向左 推一步，
  ？，            -5+1 <0 得 -4
  -5+30>0得 0     -5

  再 想起点 -10 推一步，
  -10 + Math.max(0，-4)>0 得 0        -4
         0                           -5 
*/
