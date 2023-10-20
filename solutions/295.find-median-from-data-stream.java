/*
 * @lc app=leetcode id=295 lang=java
 *
 * [295] Find Median from Data Stream
 */

// @lc code=start
class MedianFinder {
    Queue<Integer> lq = new PriorityQueue<>((a,b)->b-a); // max-heap
    Queue<Integer> rq = new PriorityQueue<>((a,b)->a-b); // min-heap

    public MedianFinder() {
        
    }
    
    public void addNum(int num) {
        if(lq.isEmpty()) lq.offer(num);
        else if(num < lq.peek()) lq.offer(num);
        else rq.offer(num);
        
        // make balance btw lq , rq that size <=1
        if(lq.size()+2 == rq.size()) lq.offer(rq.poll());
        else if(lq.size() == rq.size()+2) rq.offer(lq.poll());
    }
    
    public double findMedian() {
        if(lq.size()==rq.size()) return (lq.peek() + rq.peek())/2.0;
        if(lq.size()<rq.size()) return rq.peek();
        return lq.peek();
    }
}

/**
 * Your MedianFinder object will be instantiated and called as such:
 * MedianFinder obj = new MedianFinder();
 * obj.addNum(num);
 * double param_2 = obj.findMedian();
 */
// @lc code=end

