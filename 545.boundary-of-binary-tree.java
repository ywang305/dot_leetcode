/**
 * 
  [premium] Description:  https://github.com/grandyang/leetcode/issues/545
  
 */
class Solution {
    public List<Integer> boundaryOfBinaryTree(TreeNode root) {
        List<Integer> list = new ArrayList<>();
        if(root==null) return list;
        
        if(root.left!=null || root.right!=null) list.add(root.val);
        leftBoundary(root.left, list);
        leaves(root, list);
        rightBoundary(root.right, list);
        
        return list; 
    }
    
    void leftBoundary(TreeNode root, List<Integer> res) {
        if(root==null || (root.left==null && root.right==null)) return;
        
        res.add(root.val);
        leftBoundary(root.left!=null ? root.left : root.right, res);
    }
    
    void leaves(TreeNode root, List<Integer> res) {
        if(root==null) return;
        if(root.left==null && root.right==null) {
            res.add(root.val);
            return;
        }
        
        leaves(root.left, res);
        leaves(root.right, res);
    }
    
    void rightBoundary(TreeNode root, List<Integer> res) {
        if(root==null || (root.left==null && root.right==null)) return;
        
        rightBoundary(root.right!=null ? root.right : root.left, res);
        res.add(root.val);
    }
}