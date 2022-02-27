/*
 * @lc app=leetcode id=140 lang=javascript
 *
 * [140] Word Break II
 */

// @lc code=start
/**
 * @param {string} s
 * @param {string[]} wordDict
 * @return {string[]}
 */
var wordBreak = function (s, wordDict) {
  wordDict = new Set(wordDict);
  const ans = [];
  const temp = [];
  const DFS = (start) => {
    if (start === s.length) {
      ans.push(temp.join(" "));
      return;
    }
    for (let i = start; i < s.length; ++i) {
      const word = s.slice(start, i + 1);
      if (wordDict.has(word)) {
        temp.push(word);
        DFS(i + 1);
        temp.pop();
      }
    }
  };

  DFS(0);
  return ans;
};
// @lc code=end
