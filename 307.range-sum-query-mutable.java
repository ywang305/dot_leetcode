/*
 * @lc app=leetcode id=307 lang=java
 *
 * [307] Range Sum Query - Mutable
 */

// @lc code=start
class NumArray {

    STNode root;

    public NumArray(int[] nums) {
        root = new STNode(0, nums.length-1);
        for(int i=0; i<nums.length; ++i) {
            // root.update(i, nums[i]);   // single update works
            root.update(i, i, nums[i]); // test range update
        }
    }
    
    public void update(int index, int val) {
        // root.update(index, val);
        root.update(index, index, val);
    }
    
    public int sumRange(int left, int right) {
        return root.range(left, right);
    }

    /** Segment Tree Node */
    class STNode {
        STNode left, right;
        int val;
        int start, end;
        public STNode(int start, int end) {
            this.start = start;
            this.end = end;
        }
        // update single node from leaf node
        void update(int index, int val) {
            if(start==index && end==index) {
                this.val = val;
                return;
            }
            int mid = (start+end)/2;
            if(this.left==null) this.left = new STNode(start, mid);
            if(this.right==null) this.right = new STNode(mid+1, end);

            (index<=mid? this.left : this.right).update(index, val);
            this.val = this.left.val + this.right.val;
        }
        // this is range update also works
        void update(int s, int e, int val) {
            if(s<=start && end<=e) {
                this.val = (end-start+1) * val;
                return;
            }
            int mid = (start+end)/2;
            if(this.left==null) this.left = new STNode(start, mid);
            if(this.right==null) this.right = new STNode(mid+1, end);
            if(s<=mid) left.update(s, Math.min(e, mid), val);
            if(e>mid) right.update(Math.max(s, mid+1), e, val);
            this.val = this.left.val + this.right.val;  
        }

        // query range - sum value
        int range(int s, int e) {
            if(start==end || (s==start && e==end)) return this.val;

            int mid = (start+end)/2;
            if(s > mid) {
                return this.right.range(s, e);
            } else if(e <= mid) {
                return this.left.range(s, e);
            } else {
                return this.left.range(s, mid) + this.right.range(mid+1, e);
            }
        }
    }
}
/**
 * Your NumArray object will be instantiated and called as such:
 * NumArray obj = new NumArray(nums);
 * obj.update(index,val);
 * int param_2 = obj.sumRange(left,right);
 */
// @lc code=end

