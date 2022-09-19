/*
 * @lc app=leetcode id=449 lang=java
 *
 * [449] Serialize and Deserialize BST
 */

// @lc code=start
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode(int x) { val = x; }
 * }
 */
public class Codec {

    // Encodes a tree to a single string.
    public String serialize(TreeNode root) {
        if(root==null) return "";
        String left = serialize(root.left);
        String right = serialize(root.right);
        return root.val + (left==""? "" : ","+left) + (right==""? "" : ","+right);
    }

    // Decodes your encoded data to tree.
    public TreeNode deserialize(String data) {
        String[] arr = data.split(",");
        String valStr = arr[0];
        if(valStr.isEmpty()) return null;
        int[] numArr = Arrays.stream(arr).mapToInt(a->Integer.valueOf(a)).toArray();
        return helper(numArr, 0, numArr.length-1);
    }

    TreeNode helper(int[] arr, int start, int end) {
        if(start>end) return null;
        int rootVal = arr[start];
        var root = new TreeNode(rootVal);
        int i=start+1, j=end;
        int found = -1; 
        while(i<=j) {
            int m = i+(j-i)/2;
            if(arr[m]<rootVal) {
                found = m;  // track BS lower bound
                i = m+1;
            } else {
                j = m-1;
            }
        }
        
        if(found==-1) {
            root.left = null;
            root.right = helper(arr, start+1, end);
        } else {
            root.left = helper(arr, start+1, found);
            root.right = helper(arr, found+1, end);
        }
        return root;
    }
}

// Your Codec object will be instantiated and called as such:
// Codec ser = new Codec();
// Codec deser = new Codec();
// String tree = ser.serialize(root);
// TreeNode ans = deser.deserialize(tree);
// return ans;
// @lc code=end

