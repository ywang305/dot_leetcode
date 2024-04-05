# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def maxAncestorDiff(self, root: Optional[TreeNode]) -> int:
        def dfs(root, mi, mx):
            if not root: return 0
            max_val = max(root.val, mx)
            min_val = min(root.val, mi)
            return max(
                abs(root.val-min_val), abs(root.val-max_val),
                dfs(root.left, min_val, max_val),
                dfs(root.right, min_val, max_val)
            )
        return dfs(root, root.val, root.val)

