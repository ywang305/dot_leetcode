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
    public List<Integer> closestKValues(TreeNode root, double target, int k) {
        if(root==null) return List.of();
        List<Integer> subLeft = closestKValues(root.left, target, k);
        List<Integer> subRight = closestKValues(root.right, target, k);
        
        // 只想保留最多k个， 用PriorityQueue
        PriorityQueue<Integer> pq = new PriorityQueue<>((a,b)->Math.abs(a-target) < Math.abs(b-target) ? 1 : -1);
        pq.addAll(subLeft);
        pq.add(root.val);
        pq.addAll(subRight);
        while(pq.size()>k) pq.poll();
        return new ArrayList<>(pq);
    }
}