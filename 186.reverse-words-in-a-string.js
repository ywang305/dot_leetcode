/**
186. Reverse Words in a String II

Given a character array s, reverse the order of the words.
A word is defined as a sequence of non-space characters. The words in s will be separated by a single space.
Your code must solve the problem in-place, i.e. without allocating extra space.

Example 1:

Input: s = ["t","h","e"," ","s","k","y"," ","i","s"," ","b","l","u","e"]
Output: ["b","l","u","e"," ","i","s"," ","s","k","y"," ","t","h","e"]
Example 2:

Input: s = ["a"]
Output: ["a"]

*/

/**
 * @param {character[]} s
 * @return {void} Do not return anything, modify s in-place instead.
 */
var reverseWords = function (s) {
  s.reverse();
  const swap = (i, j) => {
    while (i < j) {
      const tmp = s[i];
      s[i] = s[j];
      s[j] = tmp;
      ++i;
      --j;
    }
  };
  for (let i = 0, j = 0; j <= s.length; ++j) {
    if (s[j] === " " || j === s.length) {
      swap(i, j - 1);
      i = j + 1;
    }
  }
};
