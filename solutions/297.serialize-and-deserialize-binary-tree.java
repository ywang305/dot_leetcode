/*
 * @lc app=leetcode id=297 lang=java
 *
 * [297] Serialize and Deserialize Binary Tree
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
        if(root==null) return String.valueOf(Integer.MIN_VALUE);
        return String.valueOf(root.val) + ',' + serialize(root.left) + ',' + serialize(root.right);
    }

    // Decodes your encoded data to tree.
    public TreeNode deserialize(String data) {
        int[] arr = Arrays.stream(data.split(",")).mapToInt(s->Integer.valueOf(s)).toArray();
        return buildTree(arr, new Index());
    }

    // recursive helper
    TreeNode buildTree(int[] arr, Index start) {
        int val = arr[start.index];
        if(val==Integer.MIN_VALUE) return null;
        var root = new TreeNode(val);
        start.index++;
        root.left = buildTree(arr, start);
        start.index++;
        root.right = buildTree(arr, start);
        return root;
    }
    
    // has to make this wrapper calss to pass index by reference, since Integer is also value-copy pass, (why?)
    class Index {
        int index = 0;
    }
}

// Your Codec object will be instantiated and called as such:
// Codec ser = new Codec();
// Codec deser = new Codec();
// TreeNode ans = deser.deserialize(ser.serialize(root));
// @lc code=end

