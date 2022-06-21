/*
 * @lc app=leetcode id=692 lang=java
 *
 * [692] Top K Frequent Words
 */
import java.util.*;
import java.util.stream.*;

// @lc code=start
class Solution {
    public List<String> topKFrequent(String[] words, int k) {
        Map<String, Integer> map = new HashMap<>();
        for (String word : words)
            map.put(word, map.getOrDefault(word, 0) + 1);
        return map.keySet().stream().sorted((a, b) -> {
            int val = map.get(b).compareTo(map.get(a));
            if (val == 0)
                return a.compareTo(b);
            return val;
            }).limit(k).collect(Collectors.toList());
    }
}
// @lc code=end

