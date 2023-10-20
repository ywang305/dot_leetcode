class FileSystem {
    
    class Trie {
        Map<String, Trie> children = new HashMap<>();
        boolean isFile = false;
        String content = "";
        String id;
        Trie(String id) {
            this.id = id;
        }
        
        Trie insert(String path, boolean isFile) {
            var node = this;
            String[] d = path.split("/");
            for(var i=1; i<d.length; ++i) {
                node = node.children.computeIfAbsent(d[i], (key)->new Trie(key));
            }
            node.isFile = isFile;
            return node;
        }
        
        Trie find(String path) {
            var node = this;
            String[] d = path.split("/");
            for(var i=1; i<d.length; ++i) {
                if(!node.children.containsKey(d[i])) return null;
                node = node.children.get(d[i]);
            }
            return node;
        }
    }
    
    Trie root;

    public FileSystem() {
        this.root = new Trie("");
    }
    
    public List<String> ls(String path) {
        Trie node = root.find(path);
        if(node==null) return List.of();
        var list = node.isFile ? List.of(node.id) : new ArrayList<>(node.children.keySet());
        return list.stream().sorted().collect(Collectors.toList());
    }
    
    public void mkdir(String path) {
        this.root.insert(path, false);
    }
    
    public void addContentToFile(String filePath, String content) {
        var file = this.root.insert(filePath, true);
        file.content += content;
    }
    
    public String readContentFromFile(String filePath) {
        Trie node = this.root.find(filePath);
        if(node==null || !node.isFile) return null;
        return node.content;
    }
}

/**
 * Your FileSystem object will be instantiated and called as such:
 * FileSystem obj = new FileSystem();
 * List<String> param_1 = obj.ls(path);
 * obj.mkdir(path);
 * obj.addContentToFile(filePath,content);
 * String param_4 = obj.readContentFromFile(filePath);
 */