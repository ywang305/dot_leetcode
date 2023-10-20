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
            root.update(i, i, nums[i]);
        }
    }
    
    public void update(int index, int val) {
        root.update(index, index, val);
    }
    
    public int sumRange(int left, int right) {
        return root.range(left, right);
    }

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
        //  range update also works
        void update(int s, int e, int val) {
            if(s<=start && end<=e) {
                this.val = (end-start+1) * val; // 模版做法。但这里仅单点更新，等价this.val = val;
                return;
            }
            int mid = (start+end)/2;
            if(this.left==null) this.left = new STNode(start, mid);
            if(this.right==null) this.right = new STNode(mid+1, end);
            if(s<=mid) left.update(s, Math.min(e, mid), val); // overlap
            if(e>mid) right.update(Math.max(s, mid+1), e, val); // overlap

            this.val = this.left.val + this.right.val;  
        }

        int range(int s, int e) {
            if(s<=start && e>=end) return val; // in range

            int res = 0, mid = (start+end)>>1;
            if(s<=mid) res += left.range(s, Math.min(e, mid));  // overlap with left
            if(e>mid) res += right.range(Math.max(s, mid+1), e); // overlap with right
            return res;
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

