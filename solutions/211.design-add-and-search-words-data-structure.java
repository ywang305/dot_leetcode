class WordDictionary {
    WordDictionary[] kids = new WordDictionary[26];
    boolean isEnd;
    public WordDictionary() {
        
    }
    
    public void addWord(String word) {
        var cur = this;
        for(var c : word.toCharArray()) {
            int index = c-'a';
            if(cur.kids[index] == null) cur.kids[index] = new WordDictionary();
            cur = cur.kids[index];
        }
        cur.isEnd = true;
    }
    
    public boolean search(String word) {
        var cur = this;
        for(int i=0; i<word.length(); ++i) {
            char c = word.charAt(i);
            if(c=='.') {
                for(var kid : cur.kids) { // watchout: cur.kids not this.kids
                    if(kid!=null && kid.search(word.substring(i+1, word.length()))) {
                        return true;
                    }
                }
                return false;
            } else {
                int index = c-'a';
                if(cur.kids[index] == null) return false;
                cur = cur.kids[index];
            }
        }
        return cur.isEnd;
    }
    
}

/**
 * Your WordDictionary object will be instantiated and called as such:
 * WordDictionary obj = new WordDictionary();
 * obj.addWord(word);
 * boolean param_2 = obj.search(word);
 */