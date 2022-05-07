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

- [5.longest-palindromic-substring](./5.longest-palindromic-substring.js) #DP \
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
  组合变种, 跳过重复的元素(如果相邻相等 continue), every time go from i+1
- [42.trapping-rain-water](./42.trapping-rain-water.js) #双指针 #DP \
  两种解法 （1） DP 空间（n) 比较好理解， （2） 双指针 空间（1）。 [ref:youtube](https://www.youtube.com/watch?v=ZI2z5pq0TqA), key: 对每个位置，找到最大的左右墙壁高度
- [44.wildcard-matching](./44.wildcard-matching.js) #DP \
  [grandyang 的解法](https://grandyang.com/leetcode/44/)
- [128.longest-consecutive-sequence](./128.longest-consecutive-sequence.js) #UnionFind \
  UnionFind 极简
- [131.palindrome-partitioning](./131.palindrome-partitioning.rb) #DP, #DFS \
  DP + backtracking \
  注意 dp 内 j i 的顺序， 先决定 j 再向前决定 i。
- [132.palindrome-partitioning-ii](./132.palindrome-partitioning-ii.js) #DP \
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
- [163.missing-ranges](./163.missing-ranges.js) #premium \
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
- [347.top-k-frequent-elements](./347.top-k-frequent-elements.js) #Bucket \
  ```
    bucket sort
    trick: ( 和传统的bucket sort 的index value 反过来！), index 是 计数，value 是 num list，
     因为count是bounded，buckets是有界的。num可能非常大，buckets很长，很多空位置浪费了。
    e.g. 1,1,1,2,2,100,100
      buckets:
        values: []    []  [2,100]  [1]   []    []   []
        index:  0     1     2      3     4     5     6
    [Bucket Sort](https://www.youtube.com/watch?v=YPTqKIgVk-k)
  ```
