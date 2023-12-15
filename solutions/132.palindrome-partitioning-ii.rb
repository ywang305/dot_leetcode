# @param {String} s
# @return {Integer}
def min_cut(s)
  dp2 = [*0...s.size]
  dp = Array.new(s.size) {[]}
  s.size.times do |j|
    (0..j).each do |i|
      dp[i][j] = s[i]==s[j] && (j-i<=2 || dp[i+1][j-1])
      if dp[i][j]
        if i==0
          dp2[j] = 0
        else
          dp2[j] = min(dp2[j], dp2[i-1] + 1)
        end
      end
    end
  end
  dp2.last
end

def min(*nums) = nums.min
