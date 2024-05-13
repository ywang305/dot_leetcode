# @param {String} s
# @return {Integer}
def calculate(s)
  s = s.gsub(/\s+/, '')
  ops = []
  nums = []
  i = 0
  while i < s.size
    c = s[i]
    case c
    when /\d/
      num = 0
      while i < s.size && s[i].match(/\d/)
        num = num * 10 + s[i].to_i
        i += 1
      end
      nums << num
      i -= 1

      if ['/', '*'].any?(ops.last)
        op = ops.pop
        n1, n2 = nums.pop(2)
        nums << (op == '*' ? n1 * n2 : n1 / n2)
      end
    else
      ops << c
      nums << 0 if i == 0
    end
    i += 1
  end

  # now ops should only contains '-' or '+'
  ops.each do |op|
    n1, n2 = nums.shift(2)
    nums.unshift(op == '+' ? n1 + n2 : n1 - n2)
  end
  nums.first
end

calculate('1+1-1')
