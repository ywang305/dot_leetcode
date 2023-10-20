/**
 * Encodes a list of strings to a single string.
 *
 * @param {string[]} strs
 * @return {string}
 */
var encode = function (strs) {
  return strs
    .map((str) => {
      const space = ("0000" + String(str.length)).slice(-4);
      return space + str;
    })
    .join("");
};

/**
 * Decodes a single string to a list of strings.
 *
 * @param {string} s
 * @return {string[]}
 */
var decode = function (s) {
  const arr = [];
  let i = 0;
  while (i < s.length) {
    const space = s.slice(i, i + 4);
    const size = Number(space);
    arr.push(s.substr(i + 4, size));
    i = i + 4 + size;
  }
  return arr;
};

/**
 * Your functions will be called as such:
 * decode(encode(strs));
 */
