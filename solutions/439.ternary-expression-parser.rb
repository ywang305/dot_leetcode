# @param {String} expression
# @return {String}
def parse_ternary(expression)
  stack = []
  i = expression.size - 1
  until i.negative?
    c = expression[i]
    if c == '?'
      second, first = stack.pop 2
      i -= 1
      stack << (expression[i] == 'T' ? first : second)
    elsif c != ':'
      stack << c
    end
    i -= 1
  end

  stack[0]
end

# @param {String} expression
# @return {String}
def parse_ternary(expression)
  qmark_cnt = 0
  split_cnt = 0
  (1...expression.size).each do |i|
    c = expression[i]
    qmark_cnt += 1 if c == '?'
    split_cnt += 1 if c == ':'
    if qmark_cnt == split_cnt
      return expression[0] == 'T' ? parse_ternary(expression[2...i]) : parse_ternary(expression[i + 1..])
    end
  end
  expression
end
