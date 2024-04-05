# @param {Integer} num_courses
# @param {Integer[][]} prerequisites
# @return {Integer[]}
def find_order(num_courses, prerequisites)
  adj_list = Array.new(num_courses){[]}
  ins = Array.new(num_courses) {0}
  prerequisites.each do |b,a|
    adj_list[a] << b
    ins[b] += 1
  end

  q = []
  topo = []
  ins.each.with_index do |deg, i|
    q << i if deg.zero?
  end
  until q.empty?
    a = q.shift
    topo << a
    adj_list[a].each do |b|
      ins[b] -= 1
      q << b if ins[b].zero?
    end
  end

  topo.size == num_courses ? topo : []
end
