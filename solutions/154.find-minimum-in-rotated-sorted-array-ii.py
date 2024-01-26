class Solution:
    def findMin(self, nums: List[int]) -> int:
        i, j = 0, len(nums)-1
        res = nums[0]
        while i <= j:
            m = i + (j-i)//2
            res = min(res, nums[m])
            if nums[m] > nums[j]: i = m + 1 # 右边无序，向右探寻
            elif nums[m] < nums[j]: j = m - 1 # 左边（可能）无序， 向左探寻
            else: j -= 1  # nums[m] == nums[j]， 缩小1位 j

        return res
