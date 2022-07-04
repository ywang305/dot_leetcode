/*
 * @lc app=leetcode id=2104 lang=java
 *
 * [2104] Sum of Subarray Ranges
 */

// @lc code=start
class Solution {
    /* Solution 1: 暴力 */
    public long subArrayRanges(int[] nums) {
        var n = nums.length;
        var ans = 0L;
        for(int i=0; i<n; ++i) {
            int min = nums[i];
            int max = nums[i];
            for(int j=i+1; j<n; ++j) {
                min = Math.min(min, nums[j]);
                max = Math.max(max, nums[j]);
                ans += max-min;
            }
        }
        return ans;
    }

    /* Solution 2: Monotonic Stack */
    public long subArrayRanges(int[] nums) {
        return maxSum(nums) - minSum(nums);
    }
    
    long maxSum(int[] nums) {
        /**
        e.g. [100, 4, 98, 60, 2, 3, 2, 1, 75, ...]
        当算到i在75时 stack里是[100的index, 98 index, 60 index, 3 index]
        （1）pop 3的index=5， 即 lastMax, leftBound 是 60的index=3， rightBound是75deindex=8
        即subarray ...60, [2, 3, 2, 1], 75...  中3是最大值，
        利用乘法组合得到多少个sūbarrays， 所以3对这些个subarrys都有贡献最大值。
        （2） 继续pop 60 index = 3， 即 60是subarrays组合的最大值  ...98, [60, 2, 3, 2, 1], 75...
            同样的故事。。。
         */
        var sum = 0L;
        var stack = new Stack<Integer>();
        for(var i=0; i<=nums.length; ++i) {
            while(!stack.empty() && (i==nums.length || nums[stack.peek()]<nums[i])) {
                var lastMax = stack.pop();
                var leftBound = stack.empty() ? -1 : stack.peek();
                var rightBound = i;
                sum += (long) nums[lastMax] * (rightBound-lastMax) * (lastMax-leftBound);
            }
            stack.push(i);
        }
        return sum;
    }
    
    long minSum(int[] nums) {
        var sum = 0L;
        var stack = new Stack<Integer>();
        for(var i=0; i<=nums.length; ++i) {
            while(!stack.empty() && (i==nums.length || nums[stack.peek()]>nums[i])) {
                var lastMin = stack.pop();
                var leftBound = stack.empty() ? -1 : stack.peek();
                var rightBound = i;
                sum += (long) nums[lastMin] * (rightBound-lastMin) * (lastMin-leftBound);
            }
            stack.push(i);
        }
        return sum;
    }
}
// @lc code=end

