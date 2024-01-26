from typing import List


class Solution:
    def findMin(self, nums: List[int]) -> int:
        i, j = 0, len(nums)-1
        res = nums[0]
        while i <= j:
            m = i + (j-i)//2
            res = min(res, nums[m])
            if nums[m] > nums[j]: i = m+1 # 左边无序，可能有更小值
            else: j = m-1 # 右边无序，可能有更小值

        return res
