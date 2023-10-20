class LRUCache {
    public LRUCache(int capacity) {
        cap = capacity;
        map = new HashMap<>();
        ll = new Node(-1, -1);
        rr = new Node(-1, -1);
        ll.back = rr;
        rr.front = ll;
    }
    
    public int get(int key) {
        if(!map.containsKey(key)) return -1;
        var node = map.get(key);
        remove(node);
        add(node);
        return node.val;
    }
    
    public void put(int key, int value) {
        if(map.containsKey(key)) {
            var node = map.get(key);
            remove(node);
        }
        Node node = new Node(key, value);
        add(node);
        map.put(key, node);
        if(map.size() > cap) {
            var header = ll.back;
            map.remove(header.key);
            remove(header);
        }
    }
    
    class Node{
        Node front, back;
        int key, val;
        public Node(int key, int val){
            this.key = key;
            this.val = val;
            front = null;
            back = null;
        }
    }
    
    void add(Node node) { // add to backend
        var front = rr.front;
        rr.front = node;
        node.back = rr;
        node.front = front;
        front.back = node;
    }
    
    void remove(Node node){
        var back = node.back;
        var front = node.front;
        if(back==null || front==null) return;
        back.front = front;
        front.back = back;
        node.front = node.back = null;
    }

    final int cap;
    Map<Integer, Node> map;
    Node ll, rr;  // left/right boundary
}

/**
 * Your LRUCache object will be instantiated and called as such:
 * LRUCache obj = new LRUCache(capacity);
 * int param_1 = obj.get(key);
 * obj.put(key,value);
 */