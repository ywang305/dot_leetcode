# @param {Integer} num_courses
# @param {Integer[][]} prerequisites
# @return {Boolean}
def can_finish(num_courses, prerequisites)
  adj_list = Array.new(num_courses){[]}
  ins = Array.new(num_courses){0}
  prerequisites.each do |post, pre|
    adj_list[pre] << post
    ins[post] += 1
  end
  q = []
  ins.each.with_index do |deg, i|
    q << i if deg.zero?
  end

  until q.empty?
    cur = q.shift
    adj_list[cur].each do |post|
      ins[post] -= 1
      q << post if ins[post].zero?
    end
  end
  ins.all?(&:zero?)
end
