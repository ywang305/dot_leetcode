/**
Given an array of n integers nums and an integer target, find the number of index triplets i, j, k with 0 <= i < j < k < n that satisfy the condition nums[i] + nums[j] + nums[k] < target.

 

Example 1:

Input: nums = [-2,0,1,3], target = 2
Output: 2
Explanation: Because there are two triplets which sums are less than 2:
[-2,0,1]
[-2,0,3]

 */
class Solution {
    public int threeSumSmaller(int[] nums, int target) {
        Arrays.sort(nums);
        int count = 0, n = nums.length;
        for(int i=0; i<n; ++i) {
            int j=i+1, k=n-1;
            while(j<k) {
                if(nums[i]+nums[j]+nums[k]<target) {
                    count += k-j;
                    ++j;
                } else {
                    --k;
                }
            }
        }
        return count;
    }
}