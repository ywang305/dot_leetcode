/*
 * @lc app=leetcode id=150 lang=javascript
 *
 * [150] Evaluate Reverse Polish Notation
 */

// @lc code=start
/**
 * @param {string[]} tokens
 * @return {number}
 */
var evalRPN = function (tokens) {
  const stack = [];
  tokens.forEach((t) => {
    if (/[0-9]/.test(t)) {
      stack.push(parseInt(t));
    } else {
      const b = stack.pop();
      const a = stack.pop();
      switch (t) {
        case "+":
          stack.push(b + a);
          break;
        case "-":
          stack.push(a - b);
          break;
        case "*":
          stack.push(a * b);
          break;
        case "/":
          stack.push(parseInt(a / b));
          break;
      }
    }
  });
  return stack[0];
};
// @lc code=end
