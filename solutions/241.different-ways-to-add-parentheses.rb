# @param {String} expression
# @return {Integer[]}
def diff_ways_to_compute(expression)
  return [expression.to_i] if expression.match?(/^\d+$/)

  ans = []
  expression.chars.each.with_index do |e, i|
    if e.match?(/\+|-|\*/)
      l_ans = diff_ways_to_compute(expression[0...i])
      r_ans = diff_ways_to_compute(expression[(i + 1)...])
      l_ans.each do |l|
        r_ans.each do |r|
          ans << l + r if e == '+'
          ans << l - r if e == '-'
          ans << l * r if e == '*'
        end
      end
    end
  end
  ans
end
