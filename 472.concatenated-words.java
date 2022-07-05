/*
 * @lc app=leetcode id=472 lang=java
 *
 * [472] Concatenated Words
 */

// @lc code=start
class Solution {
    Trie trie = new Trie();
    
    public List<String> findAllConcatenatedWordsInADict(String[] words) {
        Arrays.sort(words, (a,b)->a.length()-b.length()); // key
         
        List<String> ans = new ArrayList<>();
        for(var w : words) {
            if(dfs(w, 0)) {
                ans.add(w);
            }
            trie.insert(w);  // key
        }
        return ans;
    }
    
    public boolean dfs(String word, int start) {  
        if( start>=word.length() ) return true;
        
        for(int i=start; i<word.length(); ++i) {
            var subw = word.substring(start, i+1);
            if( trie.has(subw) && dfs(word, i+1) ) {
                return true;
            }
        }
        return false;
    }
    
    class Trie {
        Trie[] children = new Trie[26];
        boolean isEnd = false;
        
        void insert(String word) {
            var node = this;
            for(var c : word.toCharArray()) {
                if(node.children[c-'a'] == null) {
                    node.children[c-'a'] = new Trie();
                }
                node = node.children[c-'a'];
            }
            node.isEnd = true;
        }
        
        boolean has(String word) {
            var node = this;
            for(var c : word.toCharArray()) {
                if(node.children[c-'a'] == null) {
                    return false;
                }
                node = node.children[c-'a'];
            }
            return node.isEnd;
        }
    }
}
// @lc code=end

