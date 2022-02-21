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
