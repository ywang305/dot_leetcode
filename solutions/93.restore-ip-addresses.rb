# @param {String} s
# @return {String[]}
def restore_ip_addresses(s, start=0)
  ans = []
  temp = []
  dfs = lambda do |start|
    if temp.length == 4
      ans << temp.join('.') if temp.reduce(:+).length == s.length
      return
    end

    (start...[start+3, s.length].min).each do |i|
      substr = s[start..i]
      if isValid? substr
        temp.push substr
        dfs.call(i+1)
        temp.pop
      end
    end
  end

  dfs.call(0)
  ans
end

def isValid?(str)
  num = str.to_i
  str=='0' || (str[0]!='0' && num > 0 && num < 256)
end
