/*
 * @lc app=leetcode id=852 lang=java
 *
 * [852] Peak Index in a Mountain Array
 */

// @lc code=start
class Solution {
    public int peakIndexInMountainArray(int[] arr) {
        int i =0, j = arr.length-1;
        while(i<=j) {
            int m = i+(j-i)/2;
            if(arr[m]<arr[m+1]) i=m+1; // 上升段
            else if(arr[m-1]>arr[m]) j=m-1; // 下降段
            else return m; // peak
        }
        return -1;
    }
}
// @lc code=end

