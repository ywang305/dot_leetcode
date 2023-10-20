/*
 * @lc app=leetcode id=2130 lang=java
 *
 * [2130] Maximum Twin Sum of a Linked List
 */

// @lc code=start
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode() {}
 *     ListNode(int val) { this.val = val; }
 *     ListNode(int val, ListNode next) { this.val = val; this.next = next; }
 * }
 */
class Solution {
    public int pairSum(ListNode head) {
        ListNode slow  = head, fast = head.next;
        while(fast.next!=null) {
            slow = slow.next;
            fast = fast.next.next;
        }
        
        var tail = reverse(slow.next);
        
        ListNode p = head, q = tail;
        int ans = 0;
        while(p!=slow.next) {
            ans = Math.max(ans, p.val+q.val);
            p=p.next;
            q=q.next;
        }
        return ans;
    }
    
    ListNode reverse(ListNode head) {
        if(head.next == null) return head;
        var next = head.next;
        head.next = null;
        var tail = reverse(next);
        next.next = head;
        return tail;
    }
}
// @lc code=end

