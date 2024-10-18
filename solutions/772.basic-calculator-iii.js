/**
 * @param {string} s
 * @return {number}
 */
var calculate = function (s) {
  const nums = [];
  const ops = [];
  const PRIORITY = {
    ["("]: 0,
    [")"]: 0,
    ["+"]: 1,
    ["-"]: 1,
    ["*"]: 2,
    ["/"]: 2,
  };
  let i = 0;
  while (i < s.length) {
    const c = s[i];
    if (/\d/.test(c)) {
      // branch 1
      let num = 0;
      while (i < s.length && /\d/.test(s[i])) {
        num = num * 10 + +s[i];
        i += 1;
      }
      i -= 1;
      nums.push(num);
    } else if (c === ")") {
      // branch 2
      while (ops.at(-1) !== "(") {
        //after process in branch 4, 优先级从小到大，e.g. 3+8*2, 所以从后往前计算没有问题
        const op = ops.pop();
        const b = nums.pop();
        const a = nums.pop();
        nums.push(basicCalc(op, a, b));
      }
      ops.pop(); // rid of '('
    } else if (c === "(") {
      // branch 3
      ops.push(c);
    } else if (["+", "-", "*", "/"].includes(c)) {
      // branch 4
      while (ops.length && PRIORITY[ops.at(-1)] >= PRIORITY[c]) {
        const op = ops.pop();
        const b = nums.pop();
        const a = nums.pop();
        nums.push(basicCalc(op, a, b));
      }
      ops.push(c);
    }
    i += 1;
  }

  while (ops.length) {
    op = ops.pop();
    const b = nums.pop();
    const a = nums.pop();
    nums.push(basicCalc(op, a, b));
  }
  return nums[0];
};

function basicCalc(op, a, b) {
  if (op === "+") return a + b;
  if (op === "-") return a - b;
  if (op === "*") return a * b;
  if (op === "/") return (a / b) | 0; // trick to integer
}
