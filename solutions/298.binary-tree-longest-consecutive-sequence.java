/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode() {}
 *     TreeNode(int val) { this.val = val; }
 *     TreeNode(int val, TreeNode left, TreeNode right) {
 *         this.val = val;
 *         this.left = left;
 *         this.right = right;
 *     }
 * }
 */
 // using count, simple
class Solution {
    public int longestConsecutive(TreeNode root) {
        return root==null? 0 : Math.max(DFS(root, root.left, 1), DFS(root, root.right, 1));
    }

    int DFS(TreeNode pre, TreeNode cur, int count) {
        if(cur==null) return 1;
        count = pre.val+1==cur.val ? count+1 : 1;
        return Math.max(count, Math.max(DFS(cur, cur.left, count), DFS(cur, cur.right, count)));
    }
}


// using local, global
class Solution {
    public int longestConsecutive(TreeNode root) {
        return DFS(null, root).global;
    }

    Result DFS(TreeNode pre, TreeNode cur) {
        Result result = new Result();
        if(cur==null) return result;

        var left = DFS(cur, cur.left);
        var right = DFS(cur, cur.right);

        result.global = Math.max(left.global, right.global);
        if(pre!=null && pre.val+1==cur.val) {
            result.local = 1 + Math.max(left.local, right.local);
            result.global = Math.max(result.local, result.global);
        }

        return result;
    }

    class Result {
        int local = 1;
        int global = 1;
    }
}