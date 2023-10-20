
/* 原版 参考
class Solution {
    public int largestVariance(String s) {
        var ans = 0;
        for (var a = 'a'; a <= 'z'; ++a)
            for (var b = 'a'; b <= 'z'; ++b) {
                if (a == b) continue;
                var diff = 0;
                var diffWithB = -s.length();
                for (var i = 0; i < s.length(); i++) {
                    if (s.charAt(i) == a) {
                        ++diff;
                        ++diffWithB;
                    } else if (s.charAt(i) == b) {
                        diffWithB = --diff;
                        diff = Math.max(diff, 0);
                    }
                    ans = Math.max(ans, diffWithB);
                }
            }
        return ans;
    }
}

作者：endlesscheng
链接：https://leetcode.cn/problems/substring-with-largest-variance/solution/by-endlesscheng-5775/
来源：力扣（LeetCode）
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
*/



class Solution {
    public int largestVariance(String s) {
        var chars = s.toCharArray();
        var charset = new HashSet<Character>();
        for(var c : chars) charset.add(c);
        
        var ans = 0;
        for(char lc : charset) {
            for(char rc : charset) { // hashset 可以遍历
                if(lc==rc) continue;
                var diff = 0; //  a 和 b 的出现次数之差
                var diffWithB = Integer.MIN_VALUE; //维护包含了 b 的 a 和 b 的出现次数之差
                for(var c : chars) {
                    if (c == lc) {
                        ++diff;
                        ++diffWithB; // 如果全是lc，则 diffWithB是负无穷， 无论怎么加都是负数
                    } else if (c == rc) {
                        diffWithB = --diff; // 参考 bbbaaaaa的情况， 开始的3个b 对应 rc， 导致 diffWithB 是 -1
                        diff = Math.max(diff, 0);
                    }
                    ans = Math.max(ans, diffWithB);
                }
            }
        }
        return ans;
    }
}
