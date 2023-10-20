/*
 * @lc app=leetcode id=313 lang=java
 *
 * [313] Super Ugly Number
 */

// @lc code=start
class Solution {
    public int nthSuperUglyNumber(int n, int[] primes) {
        Queue<Integer> pq = new PriorityQueue<>();
        pq.offer(1);
        while(n-- > 0) {
            int top = pq.poll(); // smallest one top out
            if(n==0) return top;
            for(var k : primes) {
                if(top <= Integer.MAX_VALUE/k) pq.offer(top*k); // no overflow
                if(top % k == 0) break;  // stop add next duplicate num, e.g., top=4, cur k=2; the next k is 7, if not stop, next num top*k is 4*7=28, but shouldn't because 28 is gona be added via later top=14 as 14*2. 
            }
        }
        return -1; // no found
    }
}
// @lc code=end

