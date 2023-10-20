/*
 * @lc app=leetcode id=127 lang=java
 *
 * [127] Word Ladder
 */

// @lc code=start
class Solution {
    public int ladderLength(String beginWord, String endWord, List<String> wordList) {
        Set<String> dict = new HashSet<>(wordList);
        
        Queue<String> que = new LinkedList<>();
        que.offer(beginWord);
        
        int step = 0;
        
        while(!que.isEmpty()) {
            step += 1;
            int n = que.size();
            
            for(int i=0; i<n; ++i) {
                var word = que.poll();
                if(word.equals(endWord)) return step; //trap 不要用 word==endWord
                
                var charArr = word.toCharArray();
                for(int j=0; j<charArr.length; ++j) {
                    char oriChar = charArr[j];
                    for(var c='a'; c<='z'; ++c) {
                        charArr[j] = c;
                        var newWord = new String(charArr);
                        if(dict.contains(newWord)) {
                            que.offer(newWord);
                            dict.remove(newWord);
                        }
                    }
                    charArr[j] = oriChar;
                }
            }
        }
        
        return 0;
    }
}
// @lc code=end

