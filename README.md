## context

> **Note**
> login with vscode extension

- us login use third-party linkedin
- cn login use account/password
- us username cookie (recommand )

> **Note**
> vsc extension

- markdown-hashtags

> **Note**
> debug with rdbg

- `rdbg <ruby file>`
  - i : info
  - b + #num : break point number
  - c : continue
    > **Note**
    > debug with ruby and binding.irb
    > `binding.irb`

---

## summary

- [3.longest-substring-without-repeating-characters](./solutions/3.longest-substring-without-repeating-characters.js) #双指针哈西 \
  双指针 + Hash 记录位置, 注意更新 i 时候要比较并取最大值
- [4.median-of-two-sorted-arrays](./solutions/4.median-of-two-sorted-arrays.js) #BS \
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

- [5.longest-palindromic-substring](./solutions/5.longest-palindromic-substring.js) #DP #字符串-DP \
  经典 DP, `s[i] === s[j] && (j - i <= 2 || dp[i + 1][j - 1] === true`
- [11.container-with-most-water](./solutions/11.container-with-most-water.js) #Greedy \
  简单 Greedy， 两边缩减
- [12.integer-to-roman.java](12.integer-to-roman.java) #Greedy \
  [图解 贪心哈希表](https://leetcode.cn/problems/integer-to-roman/solution/tan-xin-ha-xi-biao-tu-jie-by-ml-zimingmeng/)
- [17.letter-combinations-of-a-phone-number](./solutions/17.letter-combinations-of-a-phone-number.js) #DFS, #组合
- [22.generate-parentheses](./solutions/22.generate-parentheses.js) #DFS
  经典 DFS
- [23.merge-k-sorted-lists](./solutions/23.merge-k-sorted-lists.js) #分治 \
  俩俩 merge， 效率 T = nlogk。 如果 brute， T = nk
- [30.substring-with-concatenation-of-all-words](./solutions/30.substring-with-concatenation-of-all-words.js) #双指针哈西 \
  sliding window 变种， 参见[youtube](https://www.youtube.com/watch?v=ddSzsLUSPrQ)理解题意
- [31.next-permutation](./solutions/31.next-permutation.js) #Array \
  array 技巧
- [32.longest-valid-parentheses](./solutions/32.longest-valid-parentheses.js) #DP \
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

- [33.search-in-rotated-sorted-array](./solutions/33.search-in-rotated-sorted-array.js) #BS \
  经典 旋转数组
- [34.find-first-and-last-position-of-element-in-sorted-array](./solutions/34.find-first-and-last-position-of-element-in-sorted-array.js) #BS \
  经典 BS lowerBound/upperBound, [关于二分查找，我有话说](https://mp.weixin.qq.com/s/YciCyjT6peM9FWfSUww8Ww)
- [37.sudoku-solver](./solutions/37.sudoku-solver.js) #DFS \
  经典 DFS
- [39.combination-sum](./solutions/39.combination-sum.js) #DFS #组合 \
  组合变种， 包括重复元素， every time go from i
- [40.combination-sum-ii](./solutions/40.combination-sum-ii.js) #DFS #组合 \
  组合变种, 跳过重复的元素, `if (i > start && candidates[i] === candidates[i - 1]) continue; `
- [42.trapping-rain-water](./solutions/42.trapping-rain-water.js) #Monotonic #DP \
  解法 （1） DP 空间（n) 比较好理解， （2） 双指针 空间（1）。 [ref:youtube](https://www.youtube.com/watch?v=ZI2z5pq0TqA), key: 对每个位置，找到最大的左右墙壁高度 \
  （3）[单调递减栈，简洁代码](https://leetcode.cn/problems/trapping-rain-water/solution/trapping-rain-water-by-ikaruga/)
- [44.wildcard-matching](./solutions/44.wildcard-matching.js) #DP #字符串-DP \
  [grandyang 的解法](https://grandyang.com/leetcode/44/)
- [45.jump-game-ii](./solutions/45.jump-game-ii.js) #DP #Greedy #区间 \
  DP T(n^2); Greedy T(n), greedy is better, [youtube neetcode](https://www.youtube.com/watch?v=dJ7sWiOoK7g), 类似于 BFS, 每次算出 reachFarthest
- [47.permutations-ii](./solutions/47.permutations-ii.js) #DFS \
    并不简单，涉及剪枝，递归逻辑也与 46.js 交换的写法 不一样（每次从 0 开始）
- [51.n-queens](./solutions/51.n-queens.js) #DFS
  经典 DFS, 吃吐
- [55.jump-game](./solutions/55.jump-game.js) #Greedy #区间 \
  当前范围/下一步范围， 要想清楚什么时候步数才一定要加一呢？ [如图](https://leetcode.cn/problems/jump-game-ii/solutions/858257/dai-ma-sui-xiang-lu-dai-ni-xue-tou-tan-x-yh58/)
- [57.insert-interval](./solutions/57.insert-interval.js) #Array \
  区间问题排除 no overlap 的 2 种情况， overlap 的情况 动态更新 start/end
- [60.permutation-sequence](./solutions/60.permutation-sequence.js) #DFS #排列 \
  hard, 不能用经典的吃吐(or I don't know how)， 对字母次序有要求
- [62.unique-paths](./solutions/62.unique-paths.rb) #DP #DFS \
  DFS 更简洁
- [63.unique-paths-ii](./solutions/63.unique-paths-ii.rb) #DP #DFS \
- [64.minimum-path-sum](./solutions/64.minimum-path-sum.js) #DP \
  经典 DP
- [69.sqrtx](./solutions/69.sqrt-x.rb) #BS \
  easy 经典 binary search
- [71.simplify-path](./solutions/71.simplify-path.rb) #String \
  经典 stack
- [72.edit-distance](./solutions/72.edit-distance.js) #DP \
  难, `Math.min(dp[i - 1][j], dp[i][j - 1], dp[i - 1][j - 1]) + 1`. dp[i - 1][j], dp[i][j - 1], dp[i - 1][j - 1]分别对应插入/删除/替换(trick)
  [完美题解](https://leetcode.cn/problems/edit-distance/solutions/189676/edit-distance-by-ikaruga/)
- [74.search-a-2d-matrix](./solutions/74.search-a-2d-matrix.js) #BS \
  经典 highbound
- [75.sort-colors](./solutions/75.sort-colors.rb) #QuickSelect \
- [76.minimum-window-substring](./solutions/76.minimum-window-substring.js) #双指针哈西 \
  hard, 双指针哈西-变种[js 解题思路 清晰明了](https://leetcode.cn/problems/minimum-window-substring/solution/jsjie-ti-si-lu-qing-xi-ming-liao-by-inte-qmpu/), [Java 注释版](./solutions/76.minimum-window-substring.java)
- [77.combinations](./solutions/77.combinations.js) #组合 \
  经典
- [78.subsets](./solutions/78.subsets.rb) #组合 \
- [79.word-search](./solutions/79.word-search.js) #DFS \
  经典 2d-map
- [80.remove-duplicates](./solutions/80.remove-duplicates.js) #双指针 \
  经典
- [81.search-in-rotated-sorted-array-ii](./solutions/81.search-in-rotated-sorted-array-ii.js) #BS \
  33.旋转数组之变种， BS 需要考虑重复元素，即重复元素下分不清是左边/右边有序，此时 start++ 即可。相当于去掉一个重复的干扰项，详见题解[搜索旋转排序数组 II](https://leetcode.cn/problems/search-in-rotated-sorted-array-ii/solution/zai-javazhong-ji-bai-liao-100de-yong-hu-by-reedfan/)
- [84.largest-rectangle-in-histogram](./solutions/84.largest-rectangle-in-histogram.js) #Monotonic \
  hard, 核心思想:求每条柱子可以向左右延伸的长度->矩形最大宽度 : 枚举高度 + 单调栈找 x 左边界
  [Monotonic 入门，使用 Monotonic 快速寻找边界](https://leetcode.cn/problems/largest-rectangle-in-histogram/solution/zhao-liang-bian-di-yi-ge-xiao-yu-ta-de-zhi-by-powc/)
- [85.maximal-rectangle](./solutions/85.maximal-rectangle.js) #Monotonic \
  hard, 84 题的变种，从第一行到第 n 行形成的柱状图可以利用 84 题求解，[Monotonic 解法](https://leetcode.cn/problems/maximal-rectangle/solution/dai-ma-jian-ji-yi-chong-huan-bu-cuo-de-j-k1p3/)
- [87.scramble-string](./solutions/87.scramble-string.rb) #DFS \
  dfs+memo: s 分解 s_left, s_right; t 分解 t_left, t_right. 原问题转化为((s_left,t_left) and (s_right, t_right) || (s_left, t_right) && (s_right, t+left)) 的子问题组合
- [90.subsets-ii](./solutions/90.subsets-ii.js) #组合 \
  [78.subsets](./solutions/78.subsets.js) 的扩展, 去重
- [91.decode-ways](./solutions/91.decode-ways.js) #DP \
  类似打家劫舍,第 i 个下标能表示的解码方法个数依赖于 i-1 和 i-2 的情况
- [92.reverse-linked-list-ii](./solutions/92.reverse-linked-list-ii.java) #DFS \
  直接 DFS 简洁，见 rb 版
- [93.restore-ip-addresses](./solutions/93.restore-ip-addresses.java) #DFS \
  经典
- [95.unique-binary-search-trees-ii](./solutions/95.unique-binary-search-trees-ii.java) #DFS \
  结合 Tree 的 DFS，更像是分治. [如果求 1...n 的所有可能：把 1 作为根节点，[ ] 空作为左子树，[ 2 ... n ] 的所有可能作为右子树；2 作为根节点，[ 1 ] 作为左子树，[ 3...n ] 的所有可能作为右子树。](https://leetcode.cn/problems/unique-binary-search-trees-ii/solution/xiang-xi-tong-su-de-si-lu-fen-xi-duo-jie-fa-by-2-7)
- [96.unique-binary-search-trees](./solutions/96.unique-binary-search-trees.rb) #DP #贡献值 \
  枚举 root，当前 root 的解 = 左解 \* 右解 （贡献值）
- [97.interleaving-strings](./solutions/97.interleaving-strings.java) #DP #字符串-DP \
  [类似 2d 路径问题](https://leetcode.cn/problems/interleaving-string/solution/lei-si-lu-jing-wen-ti-zhao-zhun-zhuang-tai-fang-ch/)
- [98.validate-binary-search-tree](./solutions/98.validate-binary-search-tree.java) #DFS #alpha-beta \
  类似 alpha-beta 限界
- [99.recover-binary-search-tree](./solutions/99.recover-binary-search-tree.java) #DFS #alpha-beta \
  有难度，利用 pre 记录 inOrder 前一个节点! ps: alpha-beta 版本见 ruby \
  并利用规律：错误 1：出现了两对不满足前小后大，需要交换第一对的第一个元素与第二对的第二个元素。错误 2：只出现一对不满足前小后大，交换这一对元素即可。 这两行关键代码可以 cover 以上 2 种错误（结合[手画图解](https://leetcode.cn/problems/recover-binary-search-tree/solution/tu-jie-hui-fu-yi-ge-er-cha-sou-suo-shu-by-hyj8/)自己体会）
  ```java
  if(pre.val > root.val && null == err1) err1 = pre;  // tricky
  if(pre.val > root.val && null != err1) err2 = root; // tricky
  ```
- [115.distinct-subsequences](./solutions/115.distinct-subsequences.java) #DP #字符串-DP \
  hard! 这是 0-1 背包问题变种？ \
  `dp[i][j] = dp[i-1][j] + ( s.charAt(i-1)==t.charAt(j-1) ? dp[i-1][j-1] : 0 ); `
- [121.best-time-to-buy-and-sell-stock](./solutions/121.best-time-to-buy-and-sell-stock.java) #DP \
  1. 这种可以无限次买卖的， 使用 dp - hold/ no_hold
  2. 贪婪-仅需记住最小价
- [122.best-time-to-buy-and-sell-stock-ii](./solutions/122.best-time-to-buy-and-sell-stock-ii.js) #DP #Greedy \
- [123.best-time-to-buy-and-sell-stock-iii](./solutions/123.best-time-to-buy-and-sell-stock-iii.rb) #DP \
  [一套模板，几行代码，闭着眼睛轻松默写所有彩票题](https://leetcode.cn/problems/best-time-to-buy-and-sell-stock-iii/solutions/2199035/yi-tao-mo-ban-ji-xing-dai-ma-bi-zhao-yan-0ap8/)
- [124.binary-tree-maximum-path-sum](./solutions/124.binary-tree-maximum-path-sum.js) #DFS \
  hard! DFS 返回 和 结果不是一个东西
- [126.word-ladder-ii](./solutions/126.word-ladder-ii.rb) #BFS #DFS \
  hard！BFS 建立图，方向为邻居点指向源点，BFS 再从后向前搜索最短路径
- [128.longest-consecutive-sequence](./solutions/128.longest-consecutive-sequence.js) #UnionFind \
  UnionFind 极简; 另一种做法利用连续数的[规律](https://leetcode.cn/problems/longest-consecutive-sequence/solutions/2362995/javapython3cha-xi-biao-ding-wei-mei-ge-l-xk4c/)
- [129.sum-root-to-leaf-numbers](./solutions/129.sum-root-to-leaf-numbers.rb) #Tree, #DFS \
  经典吃吐 on the tree
- [131.palindrome-partitioning](./solutions/131.palindrome-partitioning.rb) #DP, #DFS \
  DP + backtracking \
  注意 dp 内 j i 的顺序， 先决定 j 再向前决定 i。
- [132.palindrome-partitioning-ii](./solutions/132.palindrome-partitioning-ii.js) #DP #字符串-DP \
  hard! 双 DP, `dp2[j] = Math.min(dp2[j], dp2[i - 1] + 1);`
- [134.gas-station](./solutions/134.gas-station.js) #Greedy \
  贪婪：从前往后找，找到第一个满足条件的，就是结果
- [135.candy](./solutions/135.candy.js) #Greedy \
  贪婪， 按照条件两边扫描更新结果
- [139.word-break](./solutions/139.word-break.js) #DP \
  经典 DP[i]： s[0, i)是否可以分割, 设初始[0,0)空字符串 true
- [140.word-break-ii](./solutions/140.word-break-ii.js) #DFS \
  经典 DFS, 吃吐
- [146.lru-cache](./solutions/146.lru-cache.js) #设计 \
  JS Map 是有序 hash, 每次 get/set 都先删除再加入
- [152.maximum-product-subarray](./solutions/152.maximum-product-subarray.js) #DP \
  easy DP
- [153.find-minimum-in-rotated-sorted-array](./solutions/153.find-minimum-in-rotated-sorted-array.js) #BS \
  [一文解决 4 道「搜索旋转排序数组」题！](https://leetcode.cn/problems/find-minimum-in-rotated-sorted-array/solutions/134812/yi-wen-jie-jue-4-dao-sou-suo-xuan-zhuan-pai-xu-s-3/)
  - 本文涉及 4 道「搜索旋转排序数组」题：
    - LeetCode 33 题：搜索旋转排序数组
    - LeetCode 81 题：搜索旋转排序数组-ii
    - LeetCode 153 题：寻找旋转排序数组中的最小值
    - LeetCode 154 题：寻找旋转排序数组中的最小值-ii
  - 可以分为 3 类：
    - 33、81 题：搜索特定值
    - 153、154 题：搜索最小值
    - 81、154 题：包含重复元素
- [154.find-minimum-in-rotated-sorted-array-ii](./solutions/154.find-minimum-in-rotated-sorted-array-ii.js) #BS \
  Binary Search 变种（有重复元素）, 额外处理重复情况
- [156.binary-tree-upside-down ](./solutions/156.binary-tree-upside-down.js) \
  [premium](156.binary-tree-upsidedown.md)
- [159.longest-substring-with-at-most-two-distinct-characters](./solutions/159.longest-substring-with-at-most-two-distinct-characters.js) #双指针哈西 \
  hash 也可以记录频率， 利用频率模版[[滑动窗口真滴简单] 一招带你秒杀 12 道中等题](https://leetcode.cn/problems/longest-substring-with-at-most-two-distinct-characters/solutions/879777/hua-dong-chuang-kou-zhen-di-jian-dan-yi-73bii/?envType=study-plan-v2&envId=premium-algo-100)
  - 159. 至多包含两个不同字符的最长子串
  - 340. 至多包含 K 个不同字符的最长子串
  - 3. 无重复字符的最长子串
  - 209. 长度最小的子数组
  - 1695. 删除子数组的最大得分
  - 438. 找到字符串中所有字母异位词
  - 487. 最大连续 1 的个数 II（ 变体，思路一样 ）
  - 567. 字符串的排列
  - 487. 最大连续 1 的个数 II
  - 1004. 最大连续 1 的个数 III
  - 1208. 尽可能使字符串相等
  - 1052. 爱生气的书店老板
  - 1423. 可获得的最大点数
  - 1151. 最少交换次数来组合所有的 1
- [161.one-edit-distance](./solutions/161.one-edit-distance.js) #String \
  String, 分两种情况：字符串长度相等 或 相差 1。 找出第一个不同的位置，根据两种情况 分别比较之后子串是否相等
- [162.find-peak-element](./solutions/162.find-peak-element.js) #BS \
  Binary Search 非标准变种， 注意 i<j 和 j = m 变化
- [163.missing-ranges ](./solutions/163.missing-ranges.js) #Array #区间 \
  [premium] array, 注意边界条件
- [164.maximum-gap](./solutions/164.maximum-gap.js) #Bucket \
  [Bucket Sort, 3:00](https://www.youtube.com/watch?v=YPTqKIgVk-k) 桶排（线性）性能前提是数字均匀分布，数组能均匀映射到各个桶内, 本题大数据分布`1 <= nums.length <= 105, 0 <= nums[i] <= 109`， 桶排性能比较好。\
  本题 tick： （1） num->bucket 映射函数，(涉及 interval- 见解`bucketIndexMappingFunc`) (2) 鸽洞原理，“这是因为所有的数字要尽量平均分配到每个桶中，而不是都拥挤在一个桶中，这样保证了最大值和最小值一定不会在同一个桶中，具体的证明博主也不会”。\
  重点理解 bucket sort, bucketIndexMappingFunc, 鸽洞原理不重要
- [167.two-sum-ii-input-array-is-sorted](./solutions/167.two-sum-ii-input-array-is-sorted.js) #BS \
  Binary Search, 退化版 每次++i 或 --j
- [169.majority-element](./solutions/169.majority-element.rb) #Array \
  Moorer's Voting Alg, 见官方
- [174.dungeon-game](./solutions/174.dungeon-game.js) #DP \
  DP, 逆向推正是本题的精髓所在, 因为是求起点的状态
- [186.reverse-words-in-a-string](./solutions/186.reverse-words-in-a-string.js) #Array \
  array, 反转数组， 再反转每个单词
- [188.best-time-to-buy-and-sell-stock-iv](./solutions/188.best-time-to-buy-and-sell-stock-iv.js) #DP \
  DP, 3 维!， `dp[act次数][day]{no_hold, hold}`, \
  交易次数 act k=0 是实际不可呢的情况(至少得有一次交易吧)，但是需要初始化。 只有买入才会消耗一个交易次数，所以本次买入状态`dp[act][day]`取决于 dp`[act-1][day-1]`; 其他情况 `dp[act][day]` 取决于本次 act 维度`·`dp[act][day-1]`
- [189.rotate-array](./solutions/189.rotate-array.js) #Array \
  array, 反转数组， 再反转左右半部分
- [198.house-robber.js](./solutions/198.house-robber.js) #DP \
  DP, easy 经典 to be or not to be
- [200.number-of-islands](./solutions/200.number-of-islands.js) #UnionFind \
- [201.bitwise-and-of-numbers-range](./solutions/201.bitwise-and-of-numbers-range.rb) #bit \
  Brian Kernighan 算法的关键在于我们每次对 number 和 number−1 之间进行按位与运算后，number 中最右边的 1 会被抹去变成 0. 本题思想是 :对数字 n 迭代地应用上述技巧，清除最右边的 1，直到它小于或等于 m，此时非公共前缀部分的 1 均被消去。
- [207.course-schedule](./solutions/207.course-schedule.java) #Topo \
- [209.Minimum-Size-Subarray-Sum](./solutions/209.minimum-size-subarray-sum.java) #双指针 \
  just straightforward sliding window
- [210.course-schedule-ii](./solutions/210.course-schedule-ii.java) #Topo
- [211.design-add-and-search-words-data-structure](solutions/211.design-add-and-search-words-data-structure.rb) #Trie \
  Trie + （forloop 内混合 DFS）
- [212.word-search-ii](./solutions/212.word-search-ii.js) #Trie \
  hard, 没有那么难。 Trie + DFS
- [213.house-robber-ii](./solutions/213.house-robber-ii.java) #DP \
  此题是 198. 打家劫舍 的拓展版： 唯一的区别是此题中的房间是环状排列的（即首尾相接), 环状排列意味着第一个房子和最后一个房子中只能选择一个偷窃，因此可以把此环状排列房间问题约化为两个单排排列房间子问题：(1) 在不偷窃第一个房子的情况; (2) 在不偷窃最后一个房子的情况. 综合偷窃最大金额： 为以上两种情况的较大值.
- [214.shortest-palindrome](./solutions/214.shortest-palindrome.rb) #String \
  hard, 虽然是 HARD，涉及 KMP 算法， 但是本质很简单：s2=反转，比较直至 s1 前缀 == s2 后缀。。。 ruby 很容易实现
- [215.kth-largest-element-in-an-array](./solutions/215.kth-largest-element-in-an-array.java) #QuickSelect \
  QuickSelect 从大到小， 清晰写法
- [216.combination-sum-iii](./solutions/216.combination-sum-iii.java) #组合 \
- [218.the-skyline-problem](./solutions/218.the-skyline-problem.java) #扫描线 #PriorityQueue \
  hard! 大顶堆，[扫描线算法基本思路](https://leetcode.cn/problems/the-skyline-problem/solution/gong-shui-san-xie-sao-miao-xian-suan-fa-0z6xc/)
- [220.contains-duplicate-iii](./solutions/220.contains-duplicate-iii.java) #TreeSet \
  利用 TreeSet 作为 sliding window，用法：floor, ceiling, TreeSet.pollFirst() // 取出最小值, 本题不能用 pollFrist，而是 remove(someValue)
- [221.maximal-square](./solutions/221.maximal-square.java) #DP \
  理解 min(上, 左, 左上) + 1
- [222.count-complete-tree-nodes](./solutions/222.count-complete-tree-nodes.java) #Tree \
  有难度，技巧，工整简洁 [利用完全二叉树的性质优化](https://leetcode.cn/problems/count-complete-tree-nodes/solution/by-xiaochengtongxue_-guv3/)
- [224.basic-calculator](./solutions/224.basic-calculator.rb) #Stack \
  hard! 双栈，given +，-，（，）， 考虑 op 左右括号; ruby 版本更清晰简洁， 仅在')'进行清算， 符合直觉
- [227.basic-calculator-ii](./solutions/227.basic-calculator-ii.rb) #Stack \
  双栈， given +,-,\*,/, 考虑 op 优先级； 思路和 224 类似，ruby 版清晰
- [231.power-of-two](./solutions/231.power-of-two.rb) #bit \
  easy, n & (n-1) 会去掉一个最低位的 1
- [233.number-of-digit-one](./solutions/233.number-of-digit-one.py) #贡献值 \
  hard! 自行车锁算法
- [236.lowest-common-ancestor-of-a-binary-tree](./solutions/236.lowest-common-ancestor-of-a-binary-tree.rb) #Tree \
  🌲 经典
- [239.sliding-window-maximum](./solutions/239.sliding-window-maximum.java) #Monotonic \
  经典例题 单调队列
- [240.search-a-2d-matrix-ii](./solutions/240.search-a-2-d-matrix-ii.java) #Tree #Greedy \
  貌似 BinarySearch，但是本题没有确保「每行的第一个整数大于前一行的最后一个整数, 因此我们无法采取「两次二分」的做法。(骗我). [【宫水三叶】抽象 BST](https://leetcode.cn/problems/search-a-2d-matrix-ii/solution/gong-shui-san-xie-yi-ti-shuang-jie-er-fe-y1ns/)
  <details>
    <summary>抽象 BST</summary>
    <img width="730" alt="image" src="https://user-images.githubusercontent.com/24782000/184059998-8702e467-232c-41f8-91e0-68078ecebf17.png">
  </details>
- [241.different-ways-to-add-parentheses](./solutions/241.different-ways-to-add-parentheses.java) #DFS \
  括号题，针对操作符分成左右两部分递归
- [244.shortest-word-distance-ii ](./solutions/244.shortest-word-distance-ii.java) #TreeSet \
  利用 TreeSet floor(target) ceiling(target) 快速查找 target 之在 TreeSet 内的上下界，注意如果未找到返回 null
- [247.strobogrammatic-number-ii ](./solutions/247.strobogrammatic-number-ii.java) #DFS \
  Following this pattern, we can conclude that to find all strobogrammatic numbers with N-digits, we first need to find all strobogrammatic numbers with (N - 2) digits and then append reversible digits to the beginning and the end.
- [248.strobogrammatic-number-iii ](./solutions/248.strobogrammatic-number-iii.java) #DFS \
  hard，不难，利用 247solution 直接求解
- [249.group-shifted-strings ](./solutions/249.group-shifted-strings.java) \
  Hash, (c - s.charCodeAt(0) + 26) % 26
- [251.flatten-2d-vecto ](./solutions/251.flatten-2d-vector.java) \
  内外指针
- [252.meeting-rooms](./solutions/252.meeting-rooms.rb) #区间 \
  进出计数 - 不必排序， time O(n)
- [253.meeting-rooms-ii ](./solutions/253.meeting-rooms-ii.js) #Greedy #Stack #区间 \
  建立有序数组 starts， ends. 需要的会议室仅和(任意)start/end 前后关系决定， 不必要 start/end 必须来自同一 meeting （大局观）\
  也可以不排序直接使用 252 计数法
- [254.factor-combinations ](./solutions/254.factor-combinations.java) #DFS \
  经典吃吐，但有变化（不易想到）
- [255.verify-preorder-sequence-in-binary-search-tree ](255.verify-preorder-sequence-in-binary-search-tree.java) #DFS #Tree \
  minmax 限界
- [256.paint-house ](./solutions/256.paint-house.java) #DP \
  DP, easy 经典 to be or not to be
- [259.3sum-smaller ](./solutions/259.3sum-smaller.java) #双指针
- [260.single-number-iii](./solutions/260.single-number-iii.java) #bit \
  ~(n-1) & n ：只保留最后一位 1. 本题利用 xor 后都结果中任意一位 1 作为区分标志
- [261.graph-valid-tree ](./solutions/261.graph-valid-tree.java) #DFS #UnionFind \
  一题双解，判断 given graph 是不是 tree
  - DFS 因给的条件是有向图，但求解构造的 adjList 是无向图，所以 dfs 增加参数 from 来跳过不必要的邻点
  - UnionFind 巧妙利用 2 个 conditions
- [265.paint-house-ii ](./solutions/265.paint-house-ii.java) #DP \
  同 256， 此题应该 easy（但标的 hard）
- [267.palindrome-permutation-ii ](./solutions/267.palindrome-permutation-ii.java) #排列 \
  虽然是 median，但是较难。
  思路： 收集字母次数，取字符数量一半来作为 palindrome 的 first half string 来全排序，并且去重 cs[i]==cs[start]，但依然会产生重复解， 所以需要 HashSet 来去重复（因此 过程中 continue if cs[i]==cs[start] 不写也可以）
- [269.alien-dictionary ](./solutions/269.alien-dictionary.js) #Topo \
  hard, 难点只是 edge cases 比较多
- [270.closest-binary-search-tree-value ](./solutions/270.closest-binary-search-tree-value.java) #Tree
- [271.encode-and-decode-strings ](./solutions/271.encode-and-decode-strings.js) #设计 \
  不仅 askii 字符集，如果是其它字符集怎么办？ 每个字符串前面插入（固定 4 bytes ）meta 记录后面的字符串长度
- [272.closest-binary-search-tree-value-ii ](./solutions/272.closest-binary-search-tree-value-ii.java) #PriorityQueue #Tree \
  hard, 但是不觉难, 使用 PQ 后代码很简洁
  <details>
    <summary>description</summary>

  ![image](https://user-images.githubusercontent.com/24782000/192130183-51a2b2b4-f668-4413-92f5-a38824eb9101.png)
  </details>

- [273.integer-to-english-words](./solutions/273.integer-to-english-words.java) #分治 \
  hard, 考虑情况很多，技巧-将问题分解为子问题
- [276.paint-fence ](./solutions/276.paint-fence.js) #DFS #DP \
  [DFS+memo](276.paint-fence.java) or [DP](./solutions/276.paint-fence.js), \
  dp[i] 用来表示 i 个栅栏柱的涂色的方案数，有两种情况：如果：i 与 i-1 的颜色相同，则表明 i-1 与 i-2 的颜色不同，则 i 的数目为`dp[i-2]*(k-1)`; 如果：i 与 i-1 的颜色不同，则 i 的数目为`dp[i-1]*(k-1)`, 则递推公式为：`dp[i] = dp[i-2](k-1) + dp[i-1](k-1)`
- [277.find-the-celebrity ](./solutions/277.find-the-celebrity.java) #Greedy \
  题目中说明如果存在解， 则 exact one celebrity，所以用 Greedy， 两步走：先选出可能的候选人，再检验事否满足条件
- [278.first-bad-version](solutions/278.first-bad-version.rb) #BS \
  easy
- [279.perfect-squares](./solutions/279.perfect-squares.java) #DP \
  `dp[i] = Math.min(dp[i], dp[i-j*j]+1)`
- [280.wiggle-sort](./solutions/280.wiggle-sort.js) #Greedy \
  思路和心得：1.主要看 index 的奇偶性，来判断是山峰还是山谷 peak or valley 2.因为是从左往右，左边的肯定都是经过计算和交换的。只需关心右侧的
- [282.expression-add-operators](./solutions/282.expression-add-operators.java) #DFS \
  hard! 超级难的 DFS，这里 cn 官方解法， 难点在于（1）前导 0 的处理，（2）乘法优先级的处理
- [283.move-zeroes](./solutions/283.move-zeroes.rb) #Array \
  easy, 后面覆盖前面（不需要交换）
- [284.peeking-iterator](./solutions/284.peeking-iterator.java) #设计 \
  peek 是新功能，提前一步存储 next 值
- [285.inorder-successor-in-bst ](./solutions/285.inorder-successor-in-bst.java) #Tree \
  [PD](https://leetcode.ca/all/285.html)利用 BFS 二分遍历 tricky
- [286.walls-and-gates ](solutions/286.walls-and-gates.java) #BFS \
  多源 BFS
- [287.find-the-duplicate-number](./solutions/287.find-the-duplicate-number.java) #bit \
  [官方题解-表格例子](https://leetcode.cn/problems/find-the-duplicate-number/solution/xun-zhao-zhong-fu-shu-by-leetcode-solution/)
- [289.game-of-life](./solutions/289.game-of-life.java) #复合状态 \
  如果复制 board 浪费空间。本题向周围辐射影响，巧妙利用个位和十位区分自己和周边的复合状态
- [291.word-pattern-ii ](./solutions/291.word-pattern-ii.java) #DFS \
  经典结构，但是做不出来 :(, 分两类情况考虑，（1）字符 c 已经映射过某 substring，（2）否则逐个构建 substring，注意跳过已经被映射过的 substring
- [294.flip-game-ii.rb ](./solutions/294.flip-game-ii.rb) #DFS \
- [295.find-median-from-data-stream](./solutions/295.find-median-from-data-stream.java) #设计 \
  双优先队列，令 lq 为大根堆，rq 为小根堆, 中位取决于两个堆顶元素
- [296.best-meeting-point ](./solutions/296.best-meeting-point.java) #降维 \
  hard! 归纳推理，由于是曼哈顿距离，把问题分解为 2 个一维的距离问题. [solution](https://www.cnblogs.com/grandyang/p/5291058.html)
- [297.serialize-and-deserialize-binary-tree](./solutions/297.serialize-and-deserialize-binary-tree.java) #Tree #DFS #BFS
  - 本题知识点多解法多！ DFS 序列化 Tree，参数 Index start 在反序列化的技巧 （ps： 发现 Java Integer 穿参是 value copy，即和 int 一样 ！！，不得已又增加了一个 wrapper class Index）
  - BFS [297.serialize-and-deserialize-binary-tree.js](./solutions/297.serialize-and-deserialize-binary-tree.js) 反序列化时层序遍历。
  - 构建 inorder 和 preorder 俩个序列然后再构造 tree, 注意如果有重复值需要区分它们（如 inorder [3,..3,.,3...], 无法区分哪个 3 是 root), 所以使用小数位来区分它们 如[3.0,... 3.2，... 3.1,...] (当然 mute 了原 treenode 的值), [297.serialize-and-deserialize-binary-tree(2).js](<297.serialize-and-deserialize-binary-tree(2).js>)
- [298.binary-tree-longest-consecutive-sequence ](./solutions/298.binary-tree-longest-consecutive-sequence.java) #Tree
  可以记录全局和当前的最优值，也可以使用一个 count 更加简洁
- [300.longest-increasing-subsequence](./solutions/300.longest-increasing-subsequence.js) #DP \
  经典 DP - LIS
- [301.remove-invalid-parentheses](./solutions/301.remove-invalid-parentheses.java) #DFS \
  hard! 括号题， [【宫水三叶】将括号的「是否合法」转化为「数学判定」](https://leetcode.cn/problems/remove-invalid-parentheses/solution/gong-shui-san-xie-jiang-gua-hao-de-shi-f-asu8/), 这里的数学判定是巧妙利用 平衡度 score（见 code）来简化逻辑.
- [304.range-sum-query-2-d-immutable](./solutions/304.range-sum-query-2-d-immutable.java) #PreSum \
  二维 Presum
- [305.number-of-islands-ii ](./solutions/305.number-of-islands-ii.java) #UnionFind \
  hard, 但是运用 ufo 很简单，涉及到小岛数量的融合，有几个 corner 要小心。
- [306.additive-number](306.additive-number.java) #DFS \
  经典 DFS
- [307.range-sum-query-mutable](./solutions/307.range-sum-query-mutable.java) #SegmentTree \
  [线段树入门题型](https://leetcode.cn/problems/range-sum-query-mutable/solution/by-lfool-v3x9)，本题实现方式简化版 SegmentTree, 本题是未使用 lazy pushDown， update 仅 node 而非 range (标准版见 715 题)
- [308.range-sum-query-2d-mutable ](./solutions/308.range-sum-query-2d-mutable.java) #SegmentTree \
  hard, 并不难如果熟悉 307 解法。 2d range 求和，quad segment tree 原理和 1d 二分 segment tree 一样。
- [309.best-time-to-buy-and-sell-stock-with-cooldown](309.best-time-to-buy-and-sell-stock-with-cooldown.java) #DP \
  [持股/不持股：细分为四状态](https://leetcode.cn/problems/best-time-to-buy-and-sell-stock-with-cooldown/solution/fei-zhuang-tai-ji-de-dpjiang-jie-chao-ji-tong-su-y/)
- [310.minimum-height-trees](./solutions/310.minimum-height-trees.java) #Topo \
  常规逐点 DFS 导致 LTE，Topo 用到 Tree 结构上，想法非常巧妙！逐层去掉叶节点-参考[图解 310. 最小高度树（拓扑排序，多写法）](https://leetcode.cn/problems/minimum-height-trees/solution/by-a-fei-8-hm2n/)
- [312.burst-balloons](./solutions/312.burst-balloons.rb) #DP \
  hard, 数列范围扩展到 2d DP，状态方程关键点是 K 是最后被戳破的那一个 [图解：动态规划解决戳气球问题](https://leetcode.cn/problems/burst-balloons/solution/tu-jie-dong-tai-gui-hua-jie-jue-chuo-qi-cx18h/)
- [313.super-ugly-number](./solutions/313.super-ugly-number.java) #PriorityQueue \
  技巧在于防止生成重复的数
- [314.binary-tree-vertical-order-traversal ](./solutions/314.binary-tree-vertical-order-traversal.rb) #Tree \
- [315.count-of-smaller-numbers-after-self](./solutions/315.count-of-smaller-numbers-after-self.rb) #SegmentTree \
  hard, 可以用 BS 但是依然 TLE。 SegmentTree 的 Ruby 版,动态生成子树利用 left/right one-line getter 很方便。 [思路:对某数 n，统计 min..n-1 个数](https://leetcode.cn/problems/count-of-smaller-numbers-after-self/solution/li-yong-dong-tai-kai-dian-xian-duan-shu-070m5/)
- [316.remove-duplicate-letters](./solutions/316.remove-duplicate-letters.rb) #Monotonic \
  [一招吃遍力扣四道题](https://leetcode.cn/problems/remove-duplicate-letters/solution/yi-zhao-chi-bian-li-kou-si-dao-ti-ma-ma-zai-ye-b-4/)
- [317.shortest-distance-from-all-buildings](solutions/317.shortest-distance-from-all-buildings.rb) #BFS \
  hard, 曼哈顿距离，从目标点开始探索并更新空位点(见方法 2)，涟漪现象
- [322.](solutions/322.coin-change.rb) #DFS #DP \
  2 种方法求解， dfs+memo，dp。 [动态规划套路详解](https://leetcode.cn/problems/coin-change/solutions/6568/dong-tai-gui-hua-tao-lu-xiang-jie-by-wei-lai-bu-ke/)
- [329.longest-increasing-path](./solutions/329.longest-increasing-path.js) #DFS \
  DFS + Memo 经典
- [333.largest-bst-subtree](solutions/333.largest-bst-subtree.rb) #Tree \

- [338.counting-bits](./solutions/338.counting-bits.rb) #bit \
  easy, n & (n-1) 会去掉一个最低位的 1
- [340.longest-substring-with-at-most-k-distinct-characters](./solutions/340.longest-substring-with-at-most-k-distinct-characters.js) #双指针哈西 \
  双指针+频率模版
- [394.decode-string](./solutions/394.decode-string.js) #Stack \
  [双栈解决](https://leetcode.cn/problems/decode-string/solution/394jie-zhu-zhan-jie-jue-by-wan-jia-guo-d-sqe0/)
- [347.top-k-frequent-elements](./solutions/347.top-k-frequent-elements.rb) #QuickSelect \
  top-k 系列
- [373.find-k-pairs-with-smallest-sums](./solutions/373.find-k-pairs-with-smallest-sums.rb) #PriorityQueue \
  [补充官方题解【优先队列】](https://leetcode.cn/problems/find-k-pairs-with-smallest-sums/solutions/1210221/bu-chong-guan-fang-ti-jie-you-xian-dui-l-htf8)

- [402.remove-k-digits](./solutions/402.remove-k-digits.rb) #Monotonic \
  对于两个数 123a456 和 123b456，如果 a > b， 那么数字 123a456 大于 数字 123b456。 123[a or b]456, a 的取舍在于 a>b?, 重复这个过程 123a[b or d]46, b 的取舍...
- [438.find-all-anagrams-in-a-string](solutions/438.find-all-anagrams-in-a-string.rb) #双指针 \

- [449.serialize-and-deserialize-bst](./solutions/449.serialize-and-deserialize-bst.java) #Tree #BS \
  因为 BST 所以可以二分搜索 rootVal 的分界点（如 lowerBound 或 higherBound ） [前序遍历与 BST 特性（含二分优化）](https://leetcode.cn/problems/serialize-and-deserialize-bst/solution/by-ac_oier-ncwn/)
- [472.concatenated-words](./solutions/472.concatenated-words.java) #Trie \
  hard! Trie + DFS, [另外也可以用 hashset 替代 Trie](https://leetcode.com/submissions/detail/738625181/)
- [487.max-consecutive-ones-ii](solutions/487.max-consecutive-ones-ii.js) #双指针 \
  其实这个题目等价于：给定一个区间，该区间中最多只能包含 1 个 0，求出该区间的最大长度。如果题目是这样给的，相信对滑动窗口比较熟悉的 xd 们就能一眼看出这是可以用滑动窗口解决的问题。 -
  套用频率模版
- [496.next-greater-element-i](./solutions/496.next-greater-element-i.java) #Monotonic \
  easy, Monotonic 只算右边界， 套路参考[907.sum-of-subarray-minimums](./solutions/907.sum-of-subarray-minimums.js)
  [单调栈解决 Next Greater Number 一类问题](https://leetcode.cn/problems/next-greater-element-i/solutions/8877/dan-diao-zhan-jie-jue-next-greater-number-yi-lei-w/)
- [501](solutions/501.find-mode-in-binary-search-tree.rb) #Tree \
  中序遍历是有序的 这是考点, 利用计数收集 mode（出现次数最多的值）
- [503.next-gerater-element-ii](solutions/503.next-gerater-element-ii.rb) #Monotonic \
  496 -> 单调栈解决 Next Greater Number 一类问题
- [518.](solutions/518.coin-change-ii.rb) #DP \
  背包/组合问题 - 答案简单但是 idea 很难想到
- [527.word-abbreviation ](solutions/527.word-abbreviation.rb) #Trie \
  Trie 变种,对每组构造一个能统计节点频数的字典树，uniq 根据 freq 找出最大前缀； 从首字母开始搜索，如果节点频数大于 1，就说明存在该前缀在同组中存在其他单词会导致混淆，就继续找更长的前缀，直到节点频数等于 1 为止
- [545.boundary-of-binary-tree ](./solutions/545.boundary-of-binary-tree.java) #Tree \
  tree 边界分三种情况分别 DFS
- [560.subarray-sum-equals-k](solutions/560.subarray-sum-equals-k.rb) #PreSum \
  PreSum + Freq 优化
- [588.design-in-memory-file-system](./solutions/588.design-in-memory-file-system.java) #Trie \
  hard, but not hard with Trie
- [616.add-bold-tag-in-string](solutions/616.add-bold-tag-in-string.js) #区间 \
  墨迹题， 区间去重合并
- [652.find-duplicate-subtrees](solutions/652.find-duplicate-subtrees.rb) #Tree \
  遍历记录 fingerprint，常规 DFS + 哈希表运用题
- [684.redundant-connection](./solutions/684.redundant-connection.js) #DFS #UnionFind #Topo \
  (1)dfs：边构建图，边检测环，对于 s->t 的边，检查 s 的邻接点是否能到达 t，如果可以，则说明 s->t 是环路.
  (2)本题 union find 比较容易, (3)另外也可以用拓扑排序: [三种解法总结](https://leetcode.cn/problems/redundant-connection/solution/bing-cha-ji-sou-suo-shen-du-yan-du-tuo-b-ev30/)
- [694.number-of-distinct-islands ](./solutions/694.number-of-distinct-islands.js) #DFS #UnionFind \
  关键 计算岛屿点坐标与自己基点坐标差， 利用 set 去重
- [715.range-module](715.range-module.java) #SegmentTree \
  hard! 标准的线段树实现
- [723.candy-crush](solutions/723.candy-crush.js) \
  模拟 消消乐
- [739.daily-temperatures](739.daily-temperatures.java) #Monotonic \
  同[496.next-greater-element-i](496.next-greater-element-i.java)
- [741.cherry-pickup](741.cherry-pickup.rb) #DP \
  hard! 三维 DP （官方题解）
- [746.min-cost-climbing-stairs](solutions/746.min-cost-climbing-stairs.rb) #DP \
  简单 爬楼梯系列
- [787.cheapest-flights-within-k-stops](solutions/787.cheapest-flights-within-k-stops.rb) #DFS \
  有条件最短路径问题。 dfs + memo 遍历图
- [828.count-unique-characters-of-all-substrings-of-a-given-string](./solutions/828.count-unique-characters-of-all-substrings-of-a-given-string.java) #DP #String #贡献值 \
  hard。 暴力的方法是枚举 substring，然后考察这个区间里的字符哪些是 unique 的。这需要大致 o(N^2*26)的复杂度。聪明的方法是考察每个字符，它可能在哪些 substring 里是 unique 的。 \
   重点是转换为计算每一个字符对 substring 对贡献值，并累计。 并且利用了乘法组合性质，e.g. `XXXA[XX A X]AXX`， given cur A index is 6, pre A index is 3, post A index 8, then all possible substring combination for cur A is `(6-3) * (8-6)` \
  还有 DP 解法 ([2262 变种](./solutions/2262.total-appeal-of-a-string.js)) : [四种方法 统计子串中的唯一字符](https://leetcode.cn/problems/count-unique-characters-of-all-substrings-of-a-given-string/solution/by-liu-xiao-tao-vi4x/)
- [852.](852.peak-index-in-a-mountain-array.java) #BS \
  BS 变种
- [904.fruit-into-baskets](solutions/904.fruit-into-baskets.rb) #双指针哈西 \
  不要贪，一步一步挪左指针
- [907.sum-of-subarray-minimums](./solutions/907.sum-of-subarray-minimums.js) #Monotonic #贡献值 \
  解题思路：Monotonic+贡献值, 又是每个位置的左右乘积组合 [【超小白】动画详解保证教会你这道题 ](https://leetcode.cn/problems/sum-of-subarray-minimums/solution/xiao-bai-lang-dong-hua-xiang-jie-bao-zhe-489q/)
- [926.flip-string-to-monotone-increasing](./solutions/926.flip-string-to-monotone-increasing.java) #DP #PreSum \
  [前缀和 / 动态规划](https://leetcode.cn/problems/flip-string-to-monotone-increasing/solution/qian-zhui-he-dong-tai-gui-hua-by-xiaohu9-ayii/)
- [973.k-closest-points-to-origin](./solutions/973.k-closest-points-to-origin.java) #QuickSelect \
  quickSelect， O(n)
- [994.](solutions/994.rotting-oranges.rb) #BFS # \
  BFS 图
- [1024.video-stitching](solutions/1024.video-stitching.rb) #Greedy #区间 \
  区间覆盖问题
- [1028.recover-a-tree-from-preorder-traversal](solutions/1028.recover-a-tree-from-preorder-traversal.rb) #Tree \
  输入字符窜规范化为 值，深度的 对象数组后，简单递归
- [1055.shortest-way-to-form-string](solutions/1055.shortest-way-to-form-string.js) #双指针 \
  思路很优雅优雅， 利用双指针 走几圈来判断 （具体见题）
- [1100.find-k-length-substrings-with-no-repeated-characters](solutions/1100.find-k-length-substrings-with-no-repeated-characters.js) #双指针哈西 \
  （变体）频率模版
- [1143.longest-common-subsequence](./solutions/1143.longest-common-subsequence.js) #DP #字符串-DP \
   DP, 经典
  ```js
  if (text1[i - 1] === text2[j - 1]) {
    dp[i][j] = dp[i - 1][j - 1] + 1;
  } else {
    dp[i][j] = Math.max(dp[i - 1][j], dp[i][j - 1]);
  }
  ```
- [1151.minimum-swaps-to-group-all-1s-togethe ](./solutions/1151.minimum-swaps-to-group-all-1s-together.java) \
   问题转换为移动窗口内有多少个 1
- [1135.connecting-cities-with-minimum-cost](solutions/1135.connecting-cities-with-minimum-cost.rb) #UnionFind \
  Kruskal 算法 - 添加最小边，直到森林形成 🌲 结构, 思想就是 UnionFind - union
- [1249.minimum-remove-to-make-valid-parentheses](./solutions/1249.minimum-remove-to-make-valid-parentheses.java) #Stack \
  括号题
- [1272.remove-interval](solutions/1272.remove-interval.rb) #区间 \
- [1257.smallest-common-region](solutions/1257.smallest-common-region.rb) #Tree \
  236-最小祖先变种
- [1258.synonymous-sentences](solutions/1258.synonymous-sentences.rb) #Trie #DFS \
  Trie + DFS
- [1268.search-suggestions-system](./solutions/1268.search-suggestions-system.java) #Trie \
  Trie + DFS , Trie's startsWith 有变化， 增加了一个 dfs_search, 当 startsWith 满足时，调用 dfs_search 搜索前缀尾节点（current node）之后的 3 个单词(isEnd)
- [1301](1301.number-of-paths-with-max-score.java) #DP \
  经典路径 DP
- [1567.maximum-length-of-subarray-with-positive-product]./solutions/1567.maximum-length-of-subarray-with-positive-product.java) #DP \
  正/负 两个状态 层层递推 [思路](https://leetcode.cn/problems/maximum-length-of-subarray-with-positive-product/solution/dong-tai-gui-hua-by-jiao-chun-peng-vjqi/) \
  也可以用 DFS
- [1644.lowest-common-ancestor-of-a-binary-tree-ii ](solutions/1644.lowest-common-ancestor-of-a-binary-tree-ii.js) #Tree \
- [1650](solutions/1650.lowest-common-ancestor-of-a-binary-tree-iii.rb) #Tree \
  虽然是 Tree， 但是本题等效为双链表的交点问题-160
- [1762.buildings-with-an-ocean-view ](./solutions/1762.buildings-with-an-ocean-view.rb) #Monotonic \
  简单版的 Monotonic Stack，和 next-greater-element 一样
  <details>
    <summary>description</summary>

  ![image](https://user-images.githubusercontent.com/24782000/179360538-17dcac63-ae96-471e-80f4-e27a9421656f.png)
  </details>

- [1911.maximum-alternating-subsequence-sum](./solutions/1911.maximum-alternating-subsequence-sum.java) #DP \
  to be or not to be. 两个数组表示当前位置取奇数/偶数得到的最大收益;
  奇数 oddMax[i]: 不取，则沿用前一个奇 oddMax[i-1]，取则 evenMax[i-1]-nums[i];
  偶数 evenMax[i]: 不取，则沿用前一个奇 evenMax[i-1]，取（又分 2 种情况），仅 nums[i]，或 oddMax[i-1]+nums[i];
- [1926.nearest-exit-from-entrance-in-maze](./solutions/1926.nearest-exit-from-entrance-in-maze.java) #BFS
- [2104.sum-of-subarray-ranges](./solutions/2104.sum-of-subarray-ranges.java) #Monotonic #贡献值 \
  hard! 利用'Monotonic' 和 '乘法组合'： 使用「Monotonic」找到某个 nums[i]nums[i] 的左边/右边的最近一个符合某种性质的位置，从而知道 nums[i]nums[i] 作为区间最值时，左右端点的可选择个数，再结合乘法原理知道 nums[i]nums[i] 能够作为区间最值的区间个数，从而知道 nums[i]nums[i] 对答案的贡献。 [907.sum-of-subarray-ranges 的套路](./solutions/907.sum-of-subarray-minimums.java)
- [2130.maximum-twin-sum-of-a-linked-list](./solutions/2130.maximum-twin-sum-of-a-linked-list.java)
  快慢指针 + 反转子链表
- [2214.minimum-health-to-beat-game ](./solutions/2214.minimum-health-to-beat-game.java) \
  从整体考虑 [题目看起来挺吓人其实是一道 easy 题](https://blog.csdn.net/hgq522/article/details/123982237)
- [2262.total-appeal-of-a-string](./solutions/2262.total-appeal-of-a-string.js) #贡献值 \
  Hard ! (super easy if you know it!) 又是对每个字符计算贡献值，左右组合乘法。 [对于每个字符统计贡献](https://leetcode.cn/problems/total-appeal-of-a-string/solution/dui-yu-mei-ge-zi-fu-tong-ji-gong-xian-by-4s68/)
- [2272.substring-with-largest-variance](./solutions/2272.substring-with-largest-variance.java) #DP \
  hard ！ 根据题意枚举 2 个字符，DP 使用到的 2 个状态变量感觉很 tricky（无法直观理解） ， 参考[最大子数组和的变形题](https://leetcode.cn/problems/substring-with-largest-variance/solution/by-endlesscheng-5775/)
- [2320.count-number-of-ways-to-place-houses](./solutions/2320.count-number-of-ways-to-place-houses.java) #DP \
  两种 DP 构造解法， 第一种： 选或不选结构； 第二种：`dp[i] = (dp[i-1] + dp[i-2])` Fibonacci 结构
- [2786.visit-array-positions-to-maximize-score](./solutions/2786.visit-array-positions-to-maximize-score.rb) #DP \
  https://leetcode.cn/problems/visit-array-positions-to-maximize-score/solutions/1/javapython3cdong-tai-gui-hua-wei-hu-qi-o-t67c/comments/2320748
- [2850.minimum-moves-to-spread-stones-over-grid](solutions/2850.minimum-moves-to-spread-stones-over-grid.rb) #排列 \
  居然是全排列暴力法
