from typing import Optional


class Node:
    def __init__(self, key: int, value: int):
        self.key = key
        self.value = value

class LRUCache:

    def __init__(self, capacity: int):
        self.capacity = capacity
        self.dummy = Node(key=-1, value=-1)
        self.dummy.prev = self.dummy.next = self.dummy
        self.key_to_node = dict()


    def get(self, key: int) -> int:
        node = self.get_node(key)
        return node.value if node else -1


    def put(self, key: int, value: int) -> None:
        node = self.get_node(key=key)
        if not node:
            node = Node(key, value)
            self.insert(node)
        else:
            node.value = value


    def get_node(self, key: int) -> Optional[Node]:
        if key not in self.key_to_node:
            return None
        node = self.key_to_node[key]
        self.remove(node)
        self.insert(node) # 放在最上面
        return node

    # extra methods
    def insert(self, node: Node) -> None:
        node.next = self.dummy.next
        node.prev = self.dummy
        self.dummy.next = node
        node.next.prev = node
        self.key_to_node[node.key] = node
        if len(self.key_to_node) > self.capacity:
            self.remove(self.dummy.prev)

    def remove(self, node: Node) -> None:
        node.prev.next = node.next
        node.next.prev = node.prev
        node.prev = node.next = None
        del self.key_to_node[node.key]

