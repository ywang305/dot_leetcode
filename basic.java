class Trie {
    protected Map<Character, Trie> children = new HashMap<>();
    protected boolean isEnd = false;

    public void insert(String word) {
        var node = this;
        for(var c : word.toCharArray()) {
            node = node.children.computeIfAbsent(c, (key)-> new Trie());
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
        return this.root.get(x) == x ? x : this.find( this.root.get(x) );
    }
}