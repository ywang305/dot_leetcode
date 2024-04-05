class WordDictionary:

    def __init__(self):
        self.hash = {}
        self.is_end = False

    def __getitem__(self, key):
        return self.hash[key]

    def __setitem__(self, key, value) -> None:
        self.hash[key] = value

    def addWord(self, word: str) -> None:
        node = self
        for c in word:
            node[c] = node[c] if c in node.hash else WordDictionary()
            node = node[c]
        node.is_end = True


    def search(self, word: str, start=0) -> bool:
        node = self
        for i in range(start, len(word)):
            c = word[i]
            if c == '.':
                for key, kid_node in node.hash.items():
                    if kid_node.search(word, i+1): return True
                return False

            if c not in node.hash: return False
            node = node[c]
        return node.is_end



# Your WordDictionary object will be instantiated and called as such:
# obj = WordDictionary()
# obj.addWord(word)
# param_2 = obj.search(word)
