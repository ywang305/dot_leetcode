# @param {Integer} column_number
# @return {String}
def convert_to_title(column_number)
  dict = [*'A'..'Z']
  ans = ''
  until column_number.zero?
    column_number -= 1 # key point
    index = column_number % 26
    ans = dict[index] + ans
    column_number /= 26
  end
  ans
end


p convert_to_title(701)
