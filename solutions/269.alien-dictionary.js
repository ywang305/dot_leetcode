/**
 * 
269. Alien Dictionary
Hard

There is a new alien language that uses the English alphabet. However, the order among the letters is unknown to you.

You are given a list of strings words from the alien language's dictionary, where the strings in words are sorted lexicographically by the rules of this new language.

Return a string of the unique letters in the new alien language sorted in lexicographically increasing order by the new language's rules. 
If there is no solution, return "". If there are multiple solutions, return any of them.

A string s is lexicographically smaller than a string t if at the first letter where they differ, 
the letter in s comes before the letter in t in the alien language. If the first min(s.length, t.length) letters are the same, then s is smaller if and only if s.length < t.length.

Example 1:

Input: words = ["wrt","wrf","er","ett","rftt"]
Output: "wertf"
Example 2:

Input: words = ["z","x"]
Output: "zx"
 * 
 * 
 * 
 */

/**
 * @param {string[]} words
 * @return {string}
 */
var alienOrder = function (words) {
  function AdjListNode() {
    this.indegree = 0;
    this.list = [];
  }

  const adjList = [];

  for (const word of words) {
    for (const c of word) {
      const index = c.charCodeAt() - 97;
      adjList[index] = new AdjListNode();
    }
  }

  for (let j = 1; j < words.length; ++j) {
    const w1 = words[j - 1],
      w2 = words[j];
    for (let i = 0; i < Math.max(w1.length, w2.length); ++i) {
      if (!w1[i]) break; // edge case!  no fun ["wrt","wrtkj"]
      if (!w2[i]) return ""; // edge case! no fun ["abc","ab"]

      const index1 = w1[i].charCodeAt() - 97;
      const index2 = w2[i].charCodeAt() - 97;
      if (index1 != index2) {
        adjList[index1].list.push(index2);
        adjList[index2].indegree++;
        break;
      }
    }
  }

  const q = [];
  for (let i = 0; i < 26; ++i) {
    if (adjList[i]?.indegree === 0) {
      adjList[i].indegree = -1;
      q.push(i);
    }
  }

  let order = "";
  while (q.length) {
    const index = q.shift();
    const c = String.fromCharCode(97 + index);
    order += c;
    adjList[index].list.forEach((neiIndex) => {
      const neiNode = adjList[neiIndex];
      if (--neiNode.indegree === 0) {
        q.push(neiIndex);
      }
    });
  }

  return adjList.find((node) => node?.indegree > 0) ? "" : order;
};
