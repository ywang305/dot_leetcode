/*
 * @lc app=leetcode id=99 lang=java
 *
 * [99] Recover Binary Search Tree
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
    TreeNode pre = new TreeNode(Integer.MIN_VALUE); // watch out, otherwise null exception
    TreeNode err1;
    TreeNode err2;
    
    public void recoverTree(TreeNode root) {
        inOrder(root);
        var temp = err1.val;
        err1.val = err2.val;
        err2.val = temp;
    }
    
    public void inOrder(TreeNode root) {
        if(null == root) return;
        
        inOrder(root.left);
        
        if(pre.val > root.val && null == err1) err1 = pre;  // tricky
        if(pre.val > root.val && null != err1) err2 = root; // tricky
        pre = root;
        
        inOrder(root.right);
    }
}
// @lc code=end

