/**
 * @param {string} s
 * @param {string[]} words
 * @return {string}
 */
var addBoldTag = function (s, words) {
  let ss = [...s];
  words.forEach((word) => {
    for (let i = 0; i < s.length; ++i) {
      if (s.startsWith(word, i)) {
        const j = i + word.length - 1;
        ss[i] = "<" + ss[i];
        ss[j] = ss[j] + ">";
      }
    }
  });
  ss = ss.join("").split("");

  // 栈去掉重叠
  const stack = [];
  for (let i = 0; i < ss.length; ++i) {
    if (ss[i] === "<") {
      stack.push(i);
    } else if (ss[i] === ">") {
      if (stack.length > 1) {
        ss[stack.pop()] = "";
        ss[i] = "";
      } else {
        stack.pop();
        ss[i] = ">";
      }
    }
  }
  // 合并连续
  for (let i = 0; i < ss.length; ++i) {
    if (ss[i] === "<" && ss[i - 1] === ">") {
      ss[i] = ss[i - 1] = "";
    }
  }

  return ss
    .map((c) => {
      if (c === "<") return "<b>";
      if (c === ">") return "</b>";
      return c;
    })
    .join("");
};
