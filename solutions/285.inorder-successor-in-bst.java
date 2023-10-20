// premium - description see https://leetcode.ca/all/285.html

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode(int x) { val = x; }
 * }
 */
class Solution {
    public TreeNode inorderSuccessor(TreeNode root, TreeNode p) {
        if(root==null) return null;
        
        TreeNode ans = null;
        if(root.val <= p.val) {
            ans = inorderSuccessor(root.right, p);
        } else {
            ans = inorderSuccessor(root.left, p);
            if(ans==null) {
                ans = root;
            }
        }

        return ans;
    }
}
