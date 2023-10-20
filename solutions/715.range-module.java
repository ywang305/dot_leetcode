/*
 * @lc app=leetcode id=715 lang=java
 *
 * [715] Range Module
 */

// @lc code=start
class RangeModule {
    STNode root;
    public RangeModule() {
        root = new STNode(1, (int)1e10);  // given 1 <= start < end <= 10^9
    }
    
    public void addRange(int left, int right) {
         root.update(left, right-1, 1);
    }
    
    public boolean queryRange(int left, int right) {
        int cnt = root.query(left, right-1);
        return right-left == cnt;
    }
    
    public void removeRange(int left, int right) {
        root.update(left, right-1, 0);
    }

    /** Segment Tree Node */
    class STNode {
        STNode left, right;
        int val;  // 1 for exist (from add);  0 for non-exist, from remove 
        int lazy; // lazy 表示 children haven't update their values
        int start, end;
        public STNode(int start, int end) {
            this.start = start;
            this.end = end;
            this.lazy = -1;
        }

        void pushDown() { // if lazy, then lazy propagate to children, only next level
            int mid = start+(end-start)/2;
            if(left==null) left = new STNode(start, mid); // 动态开点
            if(right==null) right = new STNode(mid+1, end); // 动态开点
            if(lazy==-1) return;
            left.val = (mid-start+1)*lazy; // update kid's val as we might need it later
            right.val = (end-mid)*lazy;
            left.lazy = right.lazy = lazy;
            lazy = -1;  // self is not lazy any more
        }
        void pushUp() {
            this.val = this.left.val + this.right.val;
        }

        // update range
        void update(int s, int e, int val) {
            if(s <= start && end <= e) {
                this.val = (end-start+1)*val;
                this.lazy = val; 
                return;
            }
            pushDown(); 
            int mid = start+(end-start)/2;
            if(s<=mid) left.update(s, Math.min(mid, e), val); // overlap with left, 难点： 这里left可能被lazy更新过，并且部分分枝又被val更新
            if(e>mid) right.update(Math.max(mid+1, s), e, val); // overlap with right
            pushUp();
        }

        // query range - cunt of 1's in the range [s, e]
        int query(int s, int e) {
            if(s <= start && end <= e) return val;
            pushDown();
            int mid = start+(end-start)/2;
            int cnt = 0;
            if(s <= mid) cnt += left.query(s, Math.min(mid, e)); // overlap with left
            if(e > mid) cnt += right.query(Math.max(mid+1, s), e); // overlap with right
            return cnt;
        }
    }
}

/**
 * Your RangeModule object will be instantiated and called as such:
 * RangeModule obj = new RangeModule();
 * obj.addRange(left,right);
 * boolean param_2 = obj.queryRange(left,right);
 * obj.removeRange(left,right);
 */
// @lc code=end

