# @param {Integer} num_courses
# @param {Integer[][]} prerequisites
# @return {Integer[]}
def find_order(num_courses, prerequisites)
  adj_list = Array.new(num_courses) { [] }
  idg = [0] * num_courses
  prerequisites.each do |b, a|
    adj_list[a] << b
    idg[b] += 1
  end

  ans = []
  q = []
  idg.each.with_index { |d, i| q << i if d == 0 }
  until q.empty?
    ans << a = q.shift
    adj_list[a].each do |b|
      idg[b] -= 1
      q << b if idg[b] == 0
    end
  end
  ans.size == num_courses ? ans : []
end
