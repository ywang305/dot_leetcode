# @param {String} s
# @return {Integer}
def calculate(s)
  s = s.gsub(/\s+/, '')
  ops = []
  nums = []
  i = 0
  while i < s.length
    c = s[i]
    case c
    when '('
      ops << c
    when '+', '-'
      nums << 0 if i == 0 || s[i - 1] == '(' # need adapt (+.. to (0+..
      ops << c
    when ')'
      cur_ops = []
      cur_ops.unshift(ops.pop) until ops.last == '('
      cur_nums = nums.pop(cur_ops.size + 1)
      nums << basic_cal(cur_nums, cur_ops)
      ops.pop # pop matched '('
    when /\d/
      num = 0
      while i < s.length && is_digit(s[i])
        num = num * 10 + s[i].to_i
        i += 1
      end
      i -= 1
      nums << num
    end
    i += 1
  end
  basic_cal(nums, ops)
end

def basic_cal(nums, ops) # basic means ops are only + -
  ops.each do |op| # cal (a-b+c...) from left to right
    n1, n2 = nums.shift(2)
    nums.unshift(op == '+' ? n1 + n2 : n1 - n2)
  end
  nums.first
end

def is_digit(x) = x =~ /\d/
