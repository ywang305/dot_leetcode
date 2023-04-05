#
# @lc app=leetcode id=315 lang=ruby
#
# [315] Count of Smaller Numbers After Self
#

# @lc code=start
# @param {Integer[]} nums
# @return {Integer[]}
def count_smaller(nums)
  # two solutions are tested, SolutionBS.new(nums).call is TLE!
  SolutionSegmentTree.new(nums).call
end

# TLE
class SolutionBS
  def initialize(nums)
      @nums = nums
  end

  def call
      ans = []
      sort_list = [] # big->small

      bsearch_lower = lambda do |target|
          i, j = 0, sort_list.length-1
          res = sort_list.length
          while i<=j do
              m = i+(j-i)/2
              if sort_list[m]>=target
                  i = m+1
              else
                  j = m-1
                  res = m
              end
          end
          res
      end

      @nums.reverse_each do |n|
          index = bsearch_lower.call(n)
          
          smaller_cnt = sort_list.length - index
          puts "#{n}, #{index}, #{smaller_cnt}"
          ans.unshift(smaller_cnt)
          sort_list.insert(index, n)
      end
      ans
  end    
end

# Works
class SolutionSegmentTree
  def initialize(nums)
      @nums = nums
  end
  def call
      min, max = @nums.minmax
      root = Node.new(min, max)
      ans = []
      @nums.reverse_each do |n|
          root.update(n, n)
          ans.unshift(if min==n then 0 else root.query(min, n-1) end) # edge case when min==n
      end
      ans
  end

  # no need to optimized push_down
  class Node
      def left
          @left ||= Node.new(@start, @mid)
      end

      def right
          @right ||= Node.new(@mid+1, @end)
      end

      def initialize(s, e)
          @start, @end, @count = s, e, 0
          @mid = @start+(@end-@start)/2
      end

      def update(s, e)
          @count += 1 # 总要+1，因为有重复数字
          return if s<=@start && @end<=e
              
          left.update(s, [e, @mid].min) if s <= @mid
          right.update([s, @mid+1].max, e) if e > @mid
      end

      def query(s, e)
          return @count if s<=@start && @end<=e

          ans = 0
          ans += left.query(s, [e, @mid].min) if s <= @mid
          ans += right.query([s, @mid+1].max, e) if e > @mid
          ans
      end
  end
end
# @lc code=end

