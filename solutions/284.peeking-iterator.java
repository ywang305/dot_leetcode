/*
 * @lc app=leetcode id=284 lang=java
 *
 * [284] Peeking Iterator
 */

// @lc code=start
// Java Iterator interface reference:
// https://docs.oracle.com/javase/8/docs/api/java/util/Iterator.html

class PeekingIterator implements Iterator<Integer> {
	Iterator<Integer> itor;
  Integer next;

	public PeekingIterator(Iterator<Integer> iterator) {
	    // initialize any member here.
	    this.itor = iterator;
        if(this.itor.hasNext()) this.next = this.itor.next();
	}
	
    // Returns the next element in the iteration without advancing the iterator.
	public Integer peek() {
        return this.next;
	}
	
	// hasNext() and next() should behave the same as in the Iterator interface.
	// Override them if needed.
	@Override
	public Integer next() {
        Integer ans = this.next;
        this.next = this.itor.hasNext() ? this.itor.next() : null;
        return ans;
	}
	
	@Override
	public boolean hasNext() {
	    return this.next != null;
	}
}
// @lc code=end

