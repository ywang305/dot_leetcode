## login

us login use third-party linkedin

cn login use account/password

## summary

- [128.longest-consecutive-sequence](./128.longest-consecutive-sequence.js) \
  UnionFind 极简
- [131.palindrome-partitioning](./131.palindrome-partitioning.rb) \
  DP + backtracking
  注意 dp 内 j i 的顺序， 先决定 j 再向前决定 i。
- [132.palindrome-partitioning-ii](./132.palindrome-partitioning-ii.js) \
  双 DP \
  `dp2[j] = Math.min(dp2[j], dp2[i - 1] + 1);`
- [134.gas-station](./134.gas-station.js) \
  贪婪：从前往后找，找到第一个满足条件的，就是结果
- [135.candy](./135.candy.js) \
  贪婪， 按照条件两边扫描更新结果
- [139.word-break](./139.word-break.js) \
  经典 DP[i]： s[0, i)是否可以分割,左开右闭, 设初始[0,0)空字符串 true
- [140.word-break-ii](./140.word-break-ii.js) \
  经典 DFS, 吃吐
- [146.lru-cache](./146.lru-cache.js) \
  Map 是有序 hash, 每次 get/set 都先删除再加入
- [152.maximum-product-subarray](./152.maximum-product-subarray.js) \
  easy DP
- [153.find-minimum-in-rotated-sorted-array](./153.find-minimum-in-rotated-sorted-array.js) \
  Binary Search 变种（无重复元素）, 比较 pivot 和 right 判断哪边 unsorted， 注意 min 值 可能位于 pivot
- [154.find-minimum-in-rotated-sorted-array-ii](./154.find-minimum-in-rotated-sorted-array-ii.js) \
  Binary Search 变种（有重复元素）, 额外处理重复情况
- [156.binary-tree-upside-down.js](./156.binary-tree-upside-down.js) \
  [premium](156.binary-tree-upsidedown.md)
- [159.longest-substring-with-at-most-k-distinct-characters](./159.longest-substring-with-at-most-k-distinct-characters.js) \
  sliding window, 左右指针 + hashmap， hashmap 记录 char 和 last index
- [161.one-edit-distance](./161.one-edit-distance.js) \
  String, 分两种情况：字符串长度相等 或 相差 1。 找出第一个不同的位置，根据两种情况 分别比较之后子串是否相等
- [162.find-peak-element](./162.find-peak-element.js) \
  Binary Search 非标准变种， 注意 i<j 和 j = m 变化
- [163.missing-ranges](./163.missing-ranges.js) \
  [premium] array, 注意边界条件
