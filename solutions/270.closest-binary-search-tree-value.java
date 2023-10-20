/**
Input: root = [4,2,5,1,3], target = 3.714286

    4
   / \
  2   5
 / \
1   3

Output: 4

 */

class Solution {
    public int closestValue(TreeNode root, double target) {
        if(root==null) return -1;
        int sub = closestValue(root.val < target? root.left : root.right, target);
        if(sub==-1) return root.val;
        return Math.abs(sub-target) < Math.abs(root.val-target) ? sub : root.val;
    }
}