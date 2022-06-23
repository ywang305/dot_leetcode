/*
 * @lc app=leetcode id=95 lang=java
 *
 * [95] Unique Binary Search Trees II
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
    public List<TreeNode> generateTrees(int n) {
        return dfs(1, n);
    }
    
    public List<TreeNode> dfs(int left, int right) {
        var roots = new ArrayList<TreeNode>();
        if(left>right) {
            roots.add(null); // watch out for this
            return roots;
        }
        if(left==right) {
            roots.add( new TreeNode(left) );
            return roots;
        }
        
        for(int i=left; i<=right; ++i) {     
            var leftTrees = dfs(left, i-1);
            var rightTrees = dfs(i+1, right);
            for(var leftTree : leftTrees) {
                for(var rightTree: rightTrees) {
                    var root = new TreeNode(i, leftTree, rightTree);
                    roots.add(root);
                }
            }
        }
        return roots;
    }
}
// @lc code=end

