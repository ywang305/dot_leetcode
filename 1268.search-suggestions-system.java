/*
 * @lc app=leetcode id=1268 lang=java
 *
 * [1268] Search Suggestions System
 */

// @lc code=start
class Solution {
    public List<List<String>> suggestedProducts(String[] products, String searchWord) {
        Arrays.sort(products);
        var trie = new Trie();
        for(var p : products) trie.insert(p);
        List<List<String>> ans = new ArrayList<List<String>>();
        
        for(int i=0; i<searchWord.length(); ++i) {
            List<String> cur = new ArrayList<>();
            var curAns = trie.startsWith( searchWord.substring(0, i+1) );
            ans.add(curAns);
        }
        
        return ans;
    }
    
    class Trie {
        Trie[] children = new Trie[26];
        boolean isEnd = false;
        
        void insert(String word) {
            var node = this;
            for(var c : word.toCharArray()) {
                if(node.children[c-'a'] == null) node.children[c-'a'] = new Trie();
                node = node.children[c-'a'];
            }
            node.isEnd = true;
        }
        
        // 变体
        List<String> startsWith(String word) {
            var node = this;
            for(var c : word.toCharArray()) {
                if(node.children[c-'a']==null) return List.of(); // *
                node = node.children[c-'a'];
            }
            
            List<String> myAns = new ArrayList<>();
            search(node, new StringBuilder(word), myAns); // DFS 从node（prefix尾）开始搜3个单词
            return myAns;
        }
        
        // dfs_search
        void search(Trie node, StringBuilder sb, List<String> myAns) {
            if(node==null) return;
            if(node.isEnd) {
                myAns.add(sb.toString());
                if(myAns.size()==3) return;
            }
            for(int i=0; i<26; ++i) {
                if(myAns.size()==3) break;
                if(node.children[i]!=null) {
                    sb.append((char) ('a'+i));
                    search(node.children[i], sb, myAns);
                    sb.deleteCharAt(sb.length()-1);
                }
            }
        }

    }
}
// @lc code=end

