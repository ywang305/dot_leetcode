# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @param {Integer} k
# @return {Integer[][]}
def k_smallest_pairs(nums1, nums2, k)
  q = PriorityQueue.new { _1 < _2 }
  ans = []
  visited = Set.new
  q.push([0, 0], nums1[0] + nums2[0])
  while ans.size < k
    i, j = q.pop
    ans << [nums1[i], nums2[j]]
    unless visited.include?([i, j + 1]) || j + 1 == nums2.size
      q.push([i, j + 1], nums1[i] + nums2[j + 1])
      visited << [i, j + 1]
    end
    unless visited.include?([i + 1, j]) || i + 1 == nums1.size
      q.push([i + 1, j], nums1[i + 1] + nums2[j])
      visited << [i + 1, j]
    end
  end
  ans
end
