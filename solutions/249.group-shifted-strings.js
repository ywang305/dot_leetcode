/**
 * @param {string[]} strings
 * @return {string[][]}
 */
var groupStrings = function (strings) {
  const group = {};
  strings.forEach((s) => {
    const key = s
      .split("")
      .map((c) => c.charCodeAt())
      .reduce((a, c) => {
        return (a += "," + ((c - s.charCodeAt(0) + 26) % 26));
      }, "");
    group[key] ||= [];
    group[key].push(s);
  });
  return Array.from(Object.values(group));
};
