/*
 * @lc app=leetcode id=227 lang=javascript
 *
 * [227] Basic Calculator II
 */

// @lc code=start
/**
 * @param {string} s
 * @return {number}
 */
var calculate = function (s) {
  s = s.replaceAll(" ", "");

  const map = new Map([
    ["*", 2],
    ["/", 2],
    ["+", 1],
    ["-", 1],
  ]);

  const ops = [],
    nums = [];

  // 清算函数
  const calc = () => {
    if (nums.length < 2) return;
    const op = ops.pop();
    const n2 = nums.pop(),
      n1 = nums.pop();
    let res;
    switch (op) {
      case "*":
        res = n1 * n2;
        break;
      case "/":
        res = Math.floor(n1 / n2);
        break;
      case "+":
        res = n1 + n2;
        break;
      case "-":
        res = n1 - n2;
        break;
    }
    nums.push(res);
  };

  for (let i = 0; i < s.length; ++i) {
    const c = s[i];
    if (isNaN(c)) {
      // + - * /
      if (i === 0) nums.push(0); // add 0: -1 -> 0-1
      while (map.get(c) <= map.get(ops.at(-1))) calc(); // current <= 栈内优先级, 清算, eg 2*3 遇到+4 则清算 2*3
      ops.push(c);
    } else {
      // 数字
      let n = 0;
      let j = i;
      while (j < s.length && !isNaN(s[j])) n = n * 10 + Number(s[j++]);
      i = j - 1;
      nums.push(n);
    }
  }
  while (ops.length) calc();
  return nums.at(-1);
};
// @lc code=end
