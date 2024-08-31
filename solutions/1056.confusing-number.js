/**
 * @param {number} n
 * @return {boolean}
 */
var confusingNumber = function (n) {
  const arr = [0, 1, -1, -1, -1, -1, 9, -1, 8, 6];
  let num1 = n;
  let num2 = 0;
  while (n !== 0) {
    d = n % 10;
    if (-1 === arr[d]) return false;
    num2 = num2 * 10 + arr[d];
    n = Math.floor(n / 10);
  }
  return num1 !== num2;
};
