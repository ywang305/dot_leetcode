/*
 * @lc app=leetcode id=222 lang=java
 *
 * [222] Count Complete Tree Nodes
 */

// @lc code=start
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
class Solution {
    public int countNodes(TreeNode root) {
        if(root==null) return 0;
        int dl = deep(root.left), dr = deep(root.right);
        if(dl==dr) // 左必满 Math.pow(2, l) - 1 + 右树高 + 1
            return (int)Math.pow(2, dl) + countNodes(root.right);
        else // 右必满 Math.pow(2, r) - 1 + 左树高 + 1
            return (int)Math.pow(2, dr) + countNodes(root.left);   
    }
    
    int deep(TreeNode root) {
        if(root==null) return 0;
        return 1 + deep(root.left);
    }
}
// @lc code=end

