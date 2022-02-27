## login

us login use third-party linkedin

cn login use account/password

## summary

- [128.longest-consecutive-sequence](./128.longest-consecutive-sequence.js) \
  极简 UnionFind class
- [131.palindrome-partitioning](./131.palindrome-partitioning.rb) \
  回文分割, DP + backtracking
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
  利用 Map 是有序 hash, 每次 get/set 都先删除再加入
- [152.maximum-product-subarray](./152.maximum-product-subarray.js) \
  easy DP
- [153.find-minimum-in-rotated-sorted-array](./153.find-minimum-in-rotated-sorted-array.js) \
  Binary Search, 利用 res 记录所有可能出现的最小值
