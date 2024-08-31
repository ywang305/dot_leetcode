/**
 *
对于任何字符串，我们可以通过删除其中一些字符（也可能不删除）来构造该字符串的 子序列 。(例如，“ace” 是 “abcde” 的子序列，而 “aec” 不是)。

给定源字符串 source 和目标字符串 target，返回 源字符串 source 中能通过串联形成目标字符串 target 的 子序列 的最小数量 。如果无法通过串联源字符串中的子序列来构造目标字符串，则返回 -1。



示例 1：

输入：source = "abc", target = "abcbc"
输出：2
解释：目标字符串 "abcbc" 可以由 "abc" 和 "bc" 形成，它们都是源字符串 "abc" 的子序列。
示例 2：

输入：source = "abc", target = "acdbc"
输出：-1
解释：由于目标字符串中包含字符 "d"，所以无法由源字符串的子序列构建目标字符串。
示例 3：

输入：source = "xyz", target = "xzyxz"
输出：3
解释：目标字符串可以按如下方式构建： "xz" + "y" + "xz"。

 *
 *
 *
 * @param {string} source
 * @param {string} target
 * @return {number}
 */
var shortestWay = function (source, target) {
  const m = source.length;
  const n = target.length;

  const srcSet = new Set(source);
  for (let i = 0; i < n; ++i) {
    if (!srcSet.has(target[i])) return -1;
  }

  let srcIdx = 0;
  for (let tgtIdx = 0; tgtIdx < n; srcIdx += 1, tgtIdx += 1) {
    while (source[srcIdx % m] != target[tgtIdx]) srcIdx += 1;
  }
  return Math.floor((srcIdx - 1) / m) + 1;
};

/**
 *  双指针 - 走几圈，优雅优雅
 *
 * - 首先，我们要判断到底 src 能不能合成 tgt，那么其实只要 tgt 中的字符在 src 中都有，最后一定是有一个答案的。我们用 set 的方法来判断很方便。
  - 然后，我们维护两个指针，分别是 srcidx 和 tgtidx 来指向两个字符串，由于 subsequence 是有顺序的，意思是我们在 source 中的指针只能往下走，例如 ab 和 ba，判定了 b 以后不可能倒回去把 a 判给 tgt。所以，我们可以巧妙的在循环中加入一个取余来保
    srcidx 的值不会溢出。如果两个指针指向的值一样，我们就都+1，循环的终止条件是 tgtidx 超出 tgt 的长度。
  - 最后，由于我们的循环得到的 srcidx 是我们应该终止的 srcidx 的+1，所以我们要求的是 floor((srcidx−1)/m) + 1. 这个代表的是我们 srcidx 在 src 字符串上到底走了几次，也就是我们最后的答案。
    \
    作者：GODDiao
    链接：https://leetcode.cn/problems/shortest-way-to-form-string/solutions/2849374/shuang-zhi-zhen-bu-jiang-li-pan-duan-by-bq32z/
 */
