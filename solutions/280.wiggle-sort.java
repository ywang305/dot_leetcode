class Solution {
    public void wiggleSort(int[] nums) {
        for(int i=0; i+1<nums.length; ++i) {
            if ((i%2==0 && nums[i]>nums[i+1]) || (i%2==1 && nums[i]<nums[i+1])) {
                swap(nums, i, i+1);
            }
        }
    }

    void swap(int[] nums, int i, int j) {
        var temp = nums[i];
        nums[i] = nums[j];
        nums[j] = temp;
    }
}