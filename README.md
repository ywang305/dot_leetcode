## login

us login use third-party linkedin

cn login use account/password

username cookie (recommand )

## summary

- [3.longest-substring-without-repeating-characters](./3.longest-substring-without-repeating-characters.js) #双指针哈西 \
  双指针 + Hash 记录位置, 注意更新 i 时候要比较并取最大值
- [4.median-of-two-sorted-arrays](./4.median-of-two-sorted-arrays.js) #BS \
  hard BS， 长度 分奇偶 2 种情况讨论， median 和 nums1，nums2 的分割点存在“此消彼长”关系（见图），分割点关联着 2 个数组总长的 median 位置。
  nums1 比 nums2 长， 只在 nums2 上做二分搜索（见图）
  ref [video: Median of Two Sorted Arrays - Binary Search - Leetcode 4 ](https://www.youtube.com/watch?v=q6IEA26hvXc)
  <details>
    <summary>total len is ODD case</summary>

  ![image](https://user-images.githubusercontent.com/24782000/164467122-91bb478e-ac8d-418c-a34e-be03ee6e79ef.png)
  </details>
  <details>
    <summary>total len is EVEN case</summary>

  ![image](https://user-images.githubusercontent.com/24782000/164467532-039cd926-9524-4a8f-9d68-192169111477.png)
  </details>

- [5.longest-palindromic-substring](./5.longest-palindromic-substring.js) #DP #字符串-DP \
  经典 DP, `s[i] === s[j] && (j - i <= 2 || dp[i + 1][j - 1] === true`
- [11.container-with-most-water](./11.container-with-most-water.js) #Greedy \
  简单 Greedy， 两边缩减
- [17.letter-combinations-of-a-phone-number](./17.letter-combinations-of-a-phone-number.js) #DFS, #组合
- [22.generate-parentheses](./22.generate-parentheses.js) #DFS
  经典 DFS
- [23.merge-k-sorted-lists](./23.merge-k-sorted-lists.js) #分治 \
  俩俩 merge， 效率 T = nlogk。 如果 brute， T = nk
- [30.substring-with-concatenation-of-all-words](./30.substring-with-concatenation-of-all-words.js) #双指针哈西 \
  sliding window 变种， 参见[youtube](https://www.youtube.com/watch?v=ddSzsLUSPrQ)理解题意
- [31.next-permutation](./31.next-permutation.js) #Array \
  Array 技巧
- [32.longest-valid-parentheses](./32.longest-valid-parentheses.js) #DP \
  较难， 关键: 结合 leetcode solution example，理解连续有效括号时的推导过程，

  ```js
  else if (s[i - dp[i - 1] - 1] === "(") { // i - dp[i - 1] - 1 是匹配的左括号index
    dp[i] = dp[i - 1] + (dp[i - dp[i - 1] - 2] ?? 0) + 2; // i - dp[i - 1] - 2 匹配的左括号index再前一个dp状态
  }
  ```

  <details>
    <summary>leetcode solution example</summary>

    <img width="870" alt="image" src="https://user-images.githubusercontent.com/24782000/166184265-80f2e7c7-5279-40bc-a2e1-3968b9131a76.png">
  </details>

- [33.search-in-rotated-sorted-array](./33.search-in-rotated-sorted-array.js) #BS \
  经典 旋转数组
- [34.find-first-and-last-position-of-element-in-sorted-array](./34.find-first-and-last-position-of-element-in-sorted-array.js) #BS \
  经典 BS lowerBound/upperBound, [关于二分查找，我有话说](https://mp.weixin.qq.com/s/YciCyjT6peM9FWfSUww8Ww)
- [37.sudoku-solver](./37.sudoku-solver.js) #DFS \
  经典 DFS
- [39.combination-sum](./39.combination-sum.js) #DFS #组合 \
  组合变种， 包括重复元素， every time go from i
- [40.combination-sum-ii](./40.combination-sum-ii.js) #DFS #组合 \
  组合变种, 跳过重复的元素, `if (i > start && candidates[i] === candidates[i - 1]) continue; `
- [42.trapping-rain-water](./42.trapping-rain-water.js) #单调栈 #DP \
  解法 （1） DP 空间（n) 比较好理解， （2） 双指针 空间（1）。 [ref:youtube](https://www.youtube.com/watch?v=ZI2z5pq0TqA), key: 对每个位置，找到最大的左右墙壁高度 \
  （3）[单调递减栈，简洁代码](https://leetcode.cn/problems/trapping-rain-water/solution/trapping-rain-water-by-ikaruga/)
- [44.wildcard-matching](./44.wildcard-matching.js) #DP #字符串-DP \
  [grandyang 的解法](https://grandyang.com/leetcode/44/)
- [45.jump-game-ii](./45.jump-game-ii.js) #DP #Greedy \
  DP T(n^2); Greedy T(n), greedy is better, [youtube neetcode](https://www.youtube.com/watch?v=dJ7sWiOoK7g), 类似于 BFS, 每次算出 reachFarthest
- [51.n-queens](./51.n-queens.js) #DFS
  经典 DFS, 吃吐
- [55.jump-game](./55.jump-game.js) #Greedy \
  每次算出 reachFarthest,
- [57.insert-interval](./57.insert-interval.js) #Array \
  区间问题排除 no overlap 的 2 种情况， overlap 的情况 动态更新 start/end
- [60.permutation-sequence](./60.permutation-sequence.js) #DFS #排列 \
  hard, 不能用经典的吃吐(or I don't know how)， 对字母次序有要求
- [62.unique-paths](./62.unique-paths.js) #DP \
  经典 DP
- [63.unique-paths-ii](./63.unique-paths-ii.js) #DP \
  经典 DP
- [64.minimum-path-sum](./64.minimum-path-sum.js) #DP \
  经典 DP
- [69.sqrtx](./69.sqrt-x.rb) #BS \
  easy 经典 binary search
- [71.simplify-path](./71.simplify-path.rb) #String \
  经典 stack
- [72.edit-distance](./72.edit-distance.js) #DP \
  难, `Math.min(dp[i - 1][j], dp[i][j - 1], dp[i - 1][j - 1]) + 1` dp[i - 1][j], dp[i][j - 1], dp[i - 1][j - 1]分别对应插入/删除/替换(trick)
- [74.search-a-2d-matrix](./74.search-a-2d-matrix.js) #BS \
  经典 highbound
- [75.sort-colors](./75.sort-colors.js) #QuickSort \
  quickSelect -> quickSort 变种， 思想一样
- [76.minimum-window-substring](./76.minimum-window-substring.js) #双指针哈西 \
  hard, 双指针哈西-变种， 配合额外控制变量 needCnt
- [77.combinations](./77.combinations.js) #组合 \
  经典
- [78.subsets](./78.subsets.js) #组合 \
  不太容易想到(想了好久, mind 一度陷入经典组合的框架)
- [79.word-search](./79.word-search.js) #DFS \
  经典 2d-map
- [80.remove-duplicates](./80.remove-duplicates.js) #双指针 \
  经典
- [81.search-in-rotated-sorted-array-ii](./81.search-in-rotated-sorted-array-ii.js) #BS \
  33.旋转数组之变种， BS 需要考虑重复元素，即重复元素下分不清是左边/右边有序，此时 start++ 即可。相当于去掉一个重复的干扰项，详见题解[搜索旋转排序数组 II](https://leetcode.cn/problems/search-in-rotated-sorted-array-ii/solution/zai-javazhong-ji-bai-liao-100de-yong-hu-by-reedfan/)
- [84.largest-rectangle-in-histogram](./84.largest-rectangle-in-histogram.js) #单调栈 \
  hard, 核心思想:求每条柱子可以向左右延伸的长度->矩形最大宽度 \* 柱子的高度, 计算以每一根柱子高度为高的矩形面积,维护面积最大值
  [单调栈入门，使用单调栈快速寻找边界](https://leetcode.cn/problems/largest-rectangle-in-histogram/solution/84-by-ikaruga/)
- [85.maximal-rectangle](./85.maximal-rectangle.js) #单调栈 \
  hard, 84 题的变种，从第一行到第 n 行形成的柱状图可以利用 84 题求解，[单调栈解法](https://leetcode.cn/problems/maximal-rectangle/solution/dai-ma-jian-ji-yi-chong-huan-bu-cuo-de-j-k1p3/)
- [90.subsets-ii](./90.subsets-ii.js) #组合 \
  [78.subsets](./78.subsets.js) 的扩展, 去重
- [91.decode-ways](./91.decode-ways.js) #DP \
  类似打家劫舍,第 i 个下标能表示的解码方法个数依赖于 i-1 和 i-2 的情况
- [92.reverse-linked-list-ii](./92.reverse-linked-list-ii.java) #DFS \
  并不简单,需要借助`reverseN`分解问题，参见[步步拆解：如何递归地反转链表的一部分](https://leetcode.cn/problems/reverse-linked-list-ii/solution/bu-bu-chai-jie-ru-he-di-gui-di-fan-zhuan-lian-biao/)
- [93.restore-ip-addresses](./93.restore-ip-addresses.java) #DFS \
  经典
- [95.unique-binary-search-trees-ii](./95.unique-binary-search-trees-ii.java) #DFS \
  结合 Tree 的 DFS，更像是分治. [如果求 1...n 的所有可能：把 1 作为根节点，[ ] 空作为左子树，[ 2 ... n ] 的所有可能作为右子树；2 作为根节点，[ 1 ] 作为左子树，[ 3...n ] 的所有可能作为右子树。](https://leetcode.cn/problems/unique-binary-search-trees-ii/solution/xiang-xi-tong-su-de-si-lu-fen-xi-duo-jie-fa-by-2-7)
- [96.unique-binary-search-trees](./96.unique-binary-search-trees.java) #DFS \
  套路 inorder traversal with left_result \* right_result
- [97.interleaving-strings](./97.interleaving-strings.java) #DP #字符串-DP \
  [类似 2d 路径问题](https://leetcode.cn/problems/interleaving-string/solution/lei-si-lu-jing-wen-ti-zhao-zhun-zhuang-tai-fang-ch/)
- [98.validate-binary-search-tree](./98.validate-binary-search-tree.java) #DFS \
  类似 alpha-beta 限界
- [99.recover-binary-search-tree](./99.recover-binary-search-tree.java) #DFS \
  有难度，利用 pre 记录 inOrder 前一个节点! \
  并利用规律：错误 1：出现了两对不满足前小后大，需要交换第一对的第一个元素与第二对的第二个元素。错误 2：只出现一对不满足前小后大，交换这一对元素即可。 这两行关键代码可以 cover 以上 2 种错误（结合[手画图解](https://leetcode.cn/problems/recover-binary-search-tree/solution/tu-jie-hui-fu-yi-ge-er-cha-sou-suo-shu-by-hyj8/)自己体会）
  ```java
  if(pre.val > root.val && null == err1) err1 = pre;  // tricky
  if(pre.val > root.val && null != err1) err2 = root; // tricky
  ```
- [115.distinct-subsequences](./115.distinct-subsequences.java) #DP #字符串-DP \
  hard! 这是 0-1 背包问题变种？ \
  `dp[i][j] = dp[i-1][j] + ( s.charAt(i-1)==t.charAt(j-1) ? dp[i-1][j-1] : 0 ); `
- [121.best-time-to-buy-and-sell-stock](./121.best-time-to-buy-and-sell-stock.java) #DP \
  或者不卖，维持 dp[i-1]的 profit，或卖掉 当前价-已知的最小值
- [122.best-time-to-buy-and-sell-stock-ii](./122.best-time-to-buy-and-sell-stock-ii.java) #DP #Greedy \
- [124.binary-tree-maximum-path-sum](./124.binary-tree-maximum-path-sum.js) #DFS \
  hard! DFS 返回 和 结果不是一个东西
- [128.longest-consecutive-sequence](./128.longest-consecutive-sequence.js) #UnionFind \
  UnionFind 极简
- [131.palindrome-partitioning](./131.palindrome-partitioning.rb) #DP, #DFS \
  DP + backtracking \
  注意 dp 内 j i 的顺序， 先决定 j 再向前决定 i。
- [132.palindrome-partitioning-ii](./132.palindrome-partitioning-ii.js) #DP #字符串-DP \
  双 DP, `dp2[j] = Math.min(dp2[j], dp2[i - 1] + 1);`
- [134.gas-station](./134.gas-station.js) #Greedy \
  贪婪：从前往后找，找到第一个满足条件的，就是结果
- [135.candy](./135.candy.js) #Greedy \
  贪婪， 按照条件两边扫描更新结果
- [139.word-break](./139.word-break.js) #DP \
  经典 DP[i]： s[0, i)是否可以分割,左开右闭, 设初始[0,0)空字符串 true
- [140.word-break-ii](./140.word-break-ii.js) #DFS \
  经典 DFS, 吃吐
- [146.lru-cache](./146.lru-cache.js) #lru \
  Map 是有序 hash, 每次 get/set 都先删除再加入
- [152.maximum-product-subarray](./152.maximum-product-subarray.js) #DP \
  easy DP
- [153.find-minimum-in-rotated-sorted-array](./153.find-minimum-in-rotated-sorted-array.js) #BS \
  Binary Search 变种（无重复元素）, 比较 pivot 和 right 判断哪边 unsorted， 注意 min 值 可能位于 pivot
- [154.find-minimum-in-rotated-sorted-array-ii](./154.find-minimum-in-rotated-sorted-array-ii.js) #BS \
  Binary Search 变种（有重复元素）, 额外处理重复情况
- [156.binary-tree-upside-down.js](./156.binary-tree-upside-down.js) #premium \
  [premium](156.binary-tree-upsidedown.md)
- [159.longest-substring-with-at-most-k-distinct-characters](./159.longest-substring-with-at-most-k-distinct-characters.js) #双指针哈西 \
  sliding window, 左右指针 + hashmap， hashmap 记录 char 和 last index
- [161.one-edit-distance](./161.one-edit-distance.js) #string \
  String, 分两种情况：字符串长度相等 或 相差 1。 找出第一个不同的位置，根据两种情况 分别比较之后子串是否相等
- [162.find-peak-element](./162.find-peak-element.js) #BS \
  Binary Search 非标准变种， 注意 i<j 和 j = m 变化
- [163.missing-ranges](./163.missing-ranges.js) #premium #Array \
  [premium] array, 注意边界条件
- [164.maximum-gap](./164.maximum-gap.js) #Bucket \
  [Bucket Sort, 3:00](https://www.youtube.com/watch?v=YPTqKIgVk-k) 桶排（线性）性能前提是数字均匀分布，数组能均匀映射到各个桶内, 本题大数据分布`1 <= nums.length <= 105, 0 <= nums[i] <= 109`， 桶排性能比较好。\
  本题 tick： （1） num->bucket 映射函数，(涉及 interval- 见解`bucketIndexMappingFunc`) (2) 鸽洞原理，“这是因为所有的数字要尽量平均分配到每个桶中，而不是都拥挤在一个桶中，这样保证了最大值和最小值一定不会在同一个桶中，具体的证明博主也不会”。\
  重点理解 bucket sort, bucketIndexMappingFunc, 鸽洞原理不重要
- [167.two-sum-ii-input-array-is-sorted](./167.two-sum-ii-input-array-is-sorted.js) #BS \
  Binary Search, 退化版 每次++i 或 --j
- [174.dungeon-game](./174.dungeon-game.js) #DP \
  DP, 逆向推正是本题的精髓所在, 因为是求起点的状态
- [186.reverse-words-in-a-string](./186.reverse-words-in-a-string.js) #array \
  array, 反转数组， 再反转每个单词
- [188.best-time-to-buy-and-sell-stock-iv](./188.best-time-to-buy-and-sell-stock-iv.js) #DP \
  DP, 3 维!， `dp[act次数][day]{no_hold, hold}`, \
  交易次数 act k=0 是实际不可呢的情况(至少得有一次交易吧)，但是需要初始化。 只有买入才会消耗一个交易次数，所以本次买入状态`dp[act][day]`取决于 dp`[act-1][day-1]`; 其他情况 `dp[act][day]` 取决于本次 act 维度`·`dp[act][day-1]`
- [189.rotate-array](./189.rotate-array.js) #array \
  array, 反转数组， 再反转左右半部分
- [198.house-robber.js](./198.house-robber.js) #DP \
  DP, easy 经典 to be or not to be
- [200.number-of-islands](./200.number-of-islands.js) #UnionFind \
  UnionFind
- [212.word-search-ii](./212.word-search-ii.js) #Trie \
  hard, 没有那么难。 Trie + DFS
- [253.meeting-rooms-ii](./253.meeting-rooms-ii.js) #Greedy #premium \
  建立有序数组 starts， ends. 需要的会议室仅和(任意)start/end 前后关系决定， 不必要 start/end 必须来自同一 meeting （大局观） [NeetCode 7:35 / 11:45](https://www.youtube.com/watch?v=FdzJmTCVyJU)
- [300.longest-increasing-subsequence](./300.longest-increasing-subsequence.js) #DP \
  经典
- [329.longest-increasing-path](./329.longest-increasing-path.js) #DFS \
  DFS + Memo 经典
- [394.decode-string](./394.decode-string.js) #栈 \
  [394.借助栈解决](https://leetcode.cn/problems/decode-string/solution/394jie-zhu-zhan-jie-jue-by-wan-jia-guo-d-sqe0/)
- [347.top-k-frequent-elements](./347.top-k-frequent-elements.js) #Bucket
  ```
    bucket sort
    trick: ( 和传统的bucket sort 的index value 反过来！), index 是 计数，value 是 num list，
     因为count是bounded，buckets是有界的。num可能非常大，buckets很长，很多空位置浪费了。(这不就是HashMap吗？)
    e.g. 1,1,1,2,2,100,100
      buckets:
        values: []    []  [2,100]  [1]   []    []   []
        index:  0     1     2      3     4     5     6
    [Bucket Sort](https://www.youtube.com/watch?v=YPTqKIgVk-k)
  ```
- [472.concatenated-words](./472.concatenated-words.java) #Trie \
  hard! Trie + DFS, [另外也可以用 hashset 替代 Trie](https://leetcode.com/submissions/detail/738625181/)
- [684.redundant-connection](./684.redundant-connection.js) #DFS #UnionFind #拓扑 \
  (1)dfs：边构建图，边检测环，对于 s->t 的边，检查 s 的邻接点是否能到达 t，如果可以，则说明 s->t 是环路.
  (2)本题 union find 比较容易, (3)另外也可以用拓扑排序: [三种解法总结](https://leetcode.cn/problems/redundant-connection/solution/bing-cha-ji-sou-suo-shen-du-yan-du-tuo-b-ev30/)
- [694.number-of-distinct-islands](./694.number-of-distinct-islands.js) #DFS #UnionFind #premium \
  关键 计算岛屿点坐标与自己基点坐标差， 利用 set 去重
- [828.count-unique-characters-of-all-substrings-of-a-given-string](./828.count-unique-characters-of-all-substrings-of-a-given-string.java) #DP #String \
  hard。 暴力的方法是枚举 substring，然后考察这个区间里的字符哪些是 unique 的。这需要大致 o(N^2*26)的复杂度。聪明的方法是考察每个字符，它可能在哪些 substring 里是 unique 的。 \
   重点是转换为计算每一个字符对 substring 对贡献值，并累计。 并且利用了乘法组合性质，e.g. `XXXA[XX A X]AXX`， given cur A index is 6, pre A index is 3, post A index 8, then all possible substring combination for cur A is `(6-3) * (8-6)` \
  还有 DP 解法 ([2262 变种](./2262.total-appeal-of-a-string.js)) : [四种方法 统计子串中的唯一字符](https://leetcode.cn/problems/count-unique-characters-of-all-substrings-of-a-given-string/solution/by-liu-xiao-tao-vi4x/)
- [1143.longest-common-subsequence](./1143.longest-common-subsequence.js) #DP #字符串-DP \
  DP, 经典
  ```js
  if (text1[i - 1] === text2[j - 1]) {
    dp[i][j] = dp[i - 1][j - 1] + 1;
  } else {
    dp[i][j] = Math.max(dp[i - 1][j], dp[i][j - 1]);
  }
  ```
- [1268.search-suggestions-system](search-suggestions-system.java) #Trie \
  Trie + DFS , Trie's startsWith 有变化， 增加了一个 dfs_search, 当 startsWith 满足时，调用 dfs_search 搜索前缀尾节点（current node）之后的 3 个单词(isEnd)
- [2104.sum-of-subarray-ranges](./2104.sum-of-subarray-ranges.java) #单调栈 \
  hard! 利用'单调栈' 和 '乘法组合' [一题三解：暴力 & 单调栈 & 栈优化！](https://leetcode.cn/problems/sum-of-subarray-ranges/solution/tong-ge-lai-shua-ti-la-yi-ti-san-jie-bao-sfas/)
- [2262.total-appeal-of-a-string](./2262.total-appeal-of-a-string.js) #DP \
  Hard [思路 tricky](https://leetcode.cn/problems/total-appeal-of-a-string/solution/dong-tai-gui-hua-by-clearlife-99kq/)
- [2272.substring-with-largest-variance](2272.substring-with-largest-variance.java) #DP \
  hard ！ 根据题意枚举 2 个字符，DP 使用到的 2 个状态变量感觉很 tricky（无法直观理解） ， 参考[最大子数组和的变形题](https://leetcode.cn/problems/substring-with-largest-variance/solution/by-endlesscheng-5775/)
- [2320.count-number-of-ways-to-place-houses](./2320.count-number-of-ways-to-place-houses.java) #DP \
  两种 DP 构造解法， 第一种： 选或不选结构； 第二种：`dp[i] = (dp[i-1] + dp[i-2])` Fibonacci 结构
