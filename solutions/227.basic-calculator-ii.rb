# @param {String} s
# @return {Integer}
def calculate(s)
  nums = []
  ops = []
  priority = { '+' => 1, '-' => 1, '*' => 2, '/' => 2 }
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
    when '+', '-', '*', '/'
      nums << basic_calc(ops.pop, *nums.pop(2)) until ops.empty? || priority[ops.last] < priority[c]
      ops << c
    end
    i += 1
  end
  nums << basic_calc(ops.pop, *nums.pop(2)) until ops.empty?
  nums[0]
end

def basic_calc(op, a, b)
  case op
  when '+'
    a + b
  when '-'
    a - b
  when '*'
    a * b
  when '/'
    a / b
  end
end
