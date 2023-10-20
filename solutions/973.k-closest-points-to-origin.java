/*
 * @lc app=leetcode id=973 lang=java
 *
 * [973] K Closest Points to Origin
 */

// @lc code=start
class Solution {
    int k;

    public int[][] kClosest(int[][] points, int k) {
        this.k = k;
        quickSelect(points, 0, points.length-1);
        return Arrays.copyOf(points, k);
    }

    public void quickSelect(int[][] points, int left, int right) {
        if(left>=right) return;

        int pivot = points[right][0] * points[right][0] + points[right][1] * points[right][1];
        int i = left;
        for (int j = left; j <= right; ++j) {
            int dist = points[j][0] * points[j][0] + points[j][1] * points[j][1];
            if (dist <= pivot) {
                swap(points, i, j);
                ++i;
            }
        }

        if (i < k) { // right side
            quickSelect(points, i, right);
        } else if (i - 1 > k) { // left side, 不包括pivot
            quickSelect(points, left, i-2);
        }
    }
    
    void swap(int[][] array, int i, int j) {
        var temp = array[i];
        array[i] = array[j];
        array[j] = temp;
    }
}
// @lc code=end

