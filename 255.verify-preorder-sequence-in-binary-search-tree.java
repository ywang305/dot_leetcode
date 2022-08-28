/**
Given an array of unique integers preorder, return true if it is the correct preorder traversal sequence of a binary search tree.

 

Example 1:


Input: preorder = [5,2,1,3,6]
Output: true
Example 2:

Input: preorder = [5,2,6,1,3]
Output: false

Constraints:

1 <= preorder.length <= 104
1 <= preorder[i] <= 104
All the elements of preorder are unique.
 */

 class Solution {
    public boolean verifyPreorder(int[] preorder) {
        return verifyHelper(preorder, 0, preorder.length-1, 0, 10000);
    }
    
    private boolean verifyHelper(int[] preorder, int left, int right, int min, int max) {
        if(left > right) return true;
        int i = left;
        for(; i <= right; i++) {
            if(preorder[i] <= min || preorder[i] >= max) return false;
            if(preorder[left] < preorder[i]) break;
        }
        return verifyHelper(preorder, left+1, i-1, min, preorder[left]) && verifyHelper(preorder, i, right, preorder[left], max);
    }
}