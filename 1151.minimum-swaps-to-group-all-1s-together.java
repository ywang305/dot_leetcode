/**
Given a binary array data, return the minimum number of swaps required to group all 1’s present in the array together in any place in the array.


Example 1:

Input: data = [1,0,1,0,1]
Output: 1
Explanation: There are 3 ways to group all 1's together:
[1,1,1,0,0] using 1 swap.
[0,1,1,1,0] using 2 swaps.
[0,0,1,1,1] using 1 swap.
The minimum is 1.

 */
 

class Solution {
    public int minSwaps(int[] data) {
        int width = (int) Arrays.stream(data).sum();
        int cnt_one = (int) Arrays.stream(data).limit(width).sum();
        int max_one = cnt_one;

        for(int i=1, j=width; j<data.length; ++i,++j) {
            if(data[i-1]==1) cnt_one -= 1;
            if(data[j] == 1) cnt_one += 1;
            max_one = Math.max(max_one, cnt_one);
        }
        return width-max_one;
    }
}