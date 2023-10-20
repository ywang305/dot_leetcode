/*
 * @lc app=leetcode id=1567 lang=java
 *
 * [1567] Maximum Length of Subarray With Positive Product
 */

// @lc code=start
class Solution {
    // 简洁的DP
    public int getMaxLen(int[] nums) {
        int n = nums.length;
        int[] pos = new int[n], neg = new int[n]; // 记录pos/neg最大长度
        if(nums[0]<0) neg[0] = 1;
        else if(nums[0]>0) pos[0] = 1;
        for(var i=1; i<n; ++i) {
            if(nums[i]<0) { // 当前negative，则本pos只能有前neg状态推出（负负得正）， 本neg只能由前pos推出
                pos[i] = neg[i-1]==0 ? 0 : neg[i-1]+1; // edge case：如果i-1是0，则当前（负数字）postive最长只能是0
                neg[i] = pos[i-1]+1;
            } else if(nums[i]>0) {
                pos[i] = pos[i-1]+1;
                neg[i] = neg[i-1]==0 ? 0 : neg[i-1]+1; // edge case 同理
            } else {
                pos[i] = neg[i] = 0;
            }
        }
        return Arrays.stream(pos).max().getAsInt();
    }

    // 另一种解法DFS，根据lc的hint
    public int getMaxLen(int[] nums) {
        return dfs(nums, 0, nums.length-1);
    }
    
    int dfs(int[] nums, int start, int end) {
        if(start==end) return nums[start]<=0? 0 : 1; // edge case
        if(start>end) return 0;
        
        int zeroIndex = -1;
        List<Integer> negIndex = new ArrayList<>();
        for(int i=start; i<=end; ++i) {
            if(nums[i]==0) {
                zeroIndex = i;
                break;
            }
            if(nums[i]<0) {
                negIndex.add(i);
            }
        }
        // zero exsist then partition
        if(zeroIndex!=-1) {
            return Math.max(dfs(nums, start, zeroIndex-1), dfs(nums, zeroIndex+1, end));
        }
        
        int negCnt = negIndex.size();
         // even neg => positive product
        if(negCnt%2==0) return end-start+1;
        // odd neg => remove first/last => make rest positive product
        return Math.max(end - negIndex.get(0), negIndex.get(negCnt-1) - start);
    } 
}
// @lc code=end

