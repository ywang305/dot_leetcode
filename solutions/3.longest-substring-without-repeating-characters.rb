#
# @lc app=leetcode id=3 lang=ruby
#
# [3] Longest Substring Without Repeating Characters
#

# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
  memo = {} # 利用位置
  left = 0
  ans = 0
  s.chars.each.with_index do |c, right|
    left = memo[c] + 1 if memo.key?(c) && memo[c] >= left
    ans = max(ans, right - left + 1)
    memo[c] = right
  end
  ans
end

def max(*v) = v.max
# @lc code=end


## @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
  hash = Hash.new{|h,k| h[k]=0} # 利用频率
  i=0
  ans = 0
  (0...s.size).each do |j|
      cur = s[j]
      hash[cur]+=1
      while j-i+1 > hash.size
          pre = s[i]
          hash[pre]-=1
          hash.delete(pre) if hash[pre]==0
          i+=1
      end
      ans = max(ans, j-i+1)
  end
  ans
end

def max(*vals)=vals.max
