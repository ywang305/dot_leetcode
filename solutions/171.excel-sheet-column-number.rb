# @param {String} column_title
# @return {Integer}
def title_to_number(column_title)
  chars = column_title.chars
  dict = [*'A'..'Z']
  ans = 0
  until chars.empty?
    cur_char = chars.shift
    cur_num = dict.index(cur_char) + 1
    ans = ans * 26 + cur_num
  end
  ans
end
