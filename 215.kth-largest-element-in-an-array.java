/*
 * @lc app=leetcode id=215 lang=java
 *
 * [215] Kth Largest Element in an Array
 */

// @lc code=start
class Solution {
    public int findKthLargest(int[] nums, int k) {
        return quickSelect(nums, 0, nums.length-1, k-1);
    }
    
    int quickSelect(int[] nums, int left, int right, int k) {
        int p = left, pivot = nums[right];
        for(int i=left; i<right; ++i) { // i<right 因为 最右边是 pivot（不动）
            if(nums[i]>=pivot) {
                swap(nums, i, p);
                ++p;
            }
        }
        swap(nums, p, right); // 最后把pivot放置到分界 p 就是 pivotIndex
        if(p<k) return quickSelect(nums, p+1, right, k);
        if(p>k) return quickSelect(nums, left, p-1, k);
        return nums[k];
        
    }
    
    void swap(int[] nums, int i, int j) {
        var temp = nums[i];
        nums[i] = nums[j];
        nums[j] = temp;
    }
}
// @lc code=end

