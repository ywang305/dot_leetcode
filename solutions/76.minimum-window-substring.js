/*
 * @lc app=leetcode id=76 lang=javascript
 *
 * [76] Minimum Window Substring
 */

// @lc code=start
/**
 * @param {string} s
 * @param {string} t
 * @return {string}
 */
var minWindow = function (s, t) {
  /**
   *  1.创建左指针，右指针
      2.将输入t的所有字符存入，map中
      3.建立循环，直到右指针到s字符串长度结束
      4.逐位移动右指针
      5.如果need中有当前右指针的字符，need中当前右指针字符对应的value - 1
      6.如果当前右指针字符对应的value === 0 needType -= 1
      7.当needType === 0时候说明已经找到符合要求的子串开始处理左指针

      作者：intelligent-i3ouman4ad
      链接：https://leetcode.cn/problems/minimum-window-substring/solution/jsjie-ti-si-lu-qing-xi-ming-liao-by-inte-qmpu/
      来源：力扣（LeetCode）
      著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
   */
  let l = 0;
  let r = 0;
  const need = new Map();
  for (let c of t) {
    need.set(c, need.has(c) ? need.get(c) + 1 : 1);
  }

  let needType = need.size;
  let res = "";
  while (r < s.length) {
    let c = s[r];
    if (need.has(c)) {
      need.set(c, need.get(c) - 1);
      if (need.get(c) === 0) needType -= 1;
    }

    while (needType === 0) {
      const newRes = s.substring(l, r + 1);
      if (!res || newRes.length < res.length) res = newRes;

      const c2 = s[l];
      if (need.has(c2)) {
        need.set(c2, need.get(c2) + 1);
        if (need.get(c2) === 1) needType += 1;
      }
      l += 1;
    }
    r += 1;
  }
  return res;
};
// @lc code=end

minWindow("DOABECODEBANC", "ABC");
