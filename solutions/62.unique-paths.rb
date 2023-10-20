#
# @lc app=leetcode id=62 lang=ruby
#
# [62] Unique Paths
#

# @lc code=start
# @param {Integer} m
# @param {Integer} n
# @return {Integer}
def unique_paths(m, n)
  return 1 if m==1 || n==1
  $map[[m,n]] ||= unique_paths(m-1, n) + unique_paths(m, n-1) # map赋值后能直接返回'值'
end

$map = {}
# @lc code=end

