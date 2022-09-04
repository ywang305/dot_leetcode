class Trie {
    Map<Character, Trie> children = new HashMap<>();
    boolean isEnd = false;
    String id; // in case need somewhere
    Trie(String id) {
        this.id = id;
    }

    public void insert(String word) {
        var node = this;
        for(var c : word.toCharArray()) {
            node = node.children.computeIfAbsent(c, (c)-> new Trie(c)); // 点睛
        }
        node.isEnd = true;
    }

    public boolean has(String word) {
        var node = this;
        for(var c : word.toCharArray()) {
            if(!node.children.containsKey(c)) return false;
            node = node.children.get(c);
        }
        return node.isEnd;
    }

    public boolean startsWith(String prefix) {
        var node = this;
        for(var c : prefix.toCharArray()) {
            if(!node.children.containsKey(c)) return false;
            node = node.children.get(c);
        }
        return true;
    }
}

// 26 lowercase version of Trie
class Trie {
    Trie[] kids;
    boolean isEnd;
    public Trie() {
        this.kids = new Trie[26];
    }
    
    public void insert(String word) {
        var cur = this;
        for(var c : word.toCharArray()) {
            if(cur.kids[c-'a']==null) cur.kids[c-'a'] = new Trie();
            cur = cur.kids[c-'a'];
        }
        cur.isEnd = true;
    }
    
    public boolean search(String word) {
        var cur = this;
        for(var c : word.toCharArray()) {
            if(cur.kids[c-'a']==null) return false;
            cur = cur.kids[c-'a'];
        }
        return cur.isEnd;
    }
    
    public boolean startsWith(String prefix) {
        var cur = this;
        for(var c : prefix.toCharArray()) {
            if(cur.kids[c-'a']==null) return false;
            cur = cur.kids[c-'a'];
        }
        return true;
    }
}



class UnionFind<T> {
    Map<T,T> root = new HashMap<>();

    void union(T x, T y) {
        var rootX = this.find(x);
        var rootY = this.find(y);
        if(rootX == rootY) return;
        this.root.put(rootX, rootY);
    }

    T find(T x) {
        if(!this.root.containsKey(x)) this.root.put(x, x);
        T parent = this.root.get(x);
        return parent == x ? x : this.find(parent);
    }
}