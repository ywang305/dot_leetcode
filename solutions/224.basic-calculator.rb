# @param {String} s
# @return {Integer}
def calculate(s)
  s = s.gsub(/\s+/, '') # no space, needed by a checker below s[i - 1] == '('
  nums = []
  ops = []
  priority = { '(' => 0, ')' => 0, '+' => 1, '-' => 1 }
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
    when ')'
      nums << basic_calc(ops.pop, *nums.pop(2)) until ops.last == '('
      ops.pop # rid of '('
    when '('
      ops << c
    when '-', '+'
      nums << basic_calc(ops.pop, *nums.pop(2)) until ops.empty? || priority[ops.last] < priority[c]
      nums << 0 if i == 0 || s[i - 1] == '(' # need adapt (+.. to (0+..
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
