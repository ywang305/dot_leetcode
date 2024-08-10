# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {String} traversal
# @return {TreeNode}
def recover_from_preorder(traversal)
  infos = []
  cur_value = 0
  cur_depth = 0
  traversal.chars.each.with_index do |c, i|
    if c == '-'
      cur_value = 0 if cur_depth == 0
      cur_depth += 1
    else
      cur_value = cur_value * 10 + c.to_i
      if i == traversal.size - 1 || traversal[i + 1] == '-'
        infos << Info.new(cur_value, cur_depth)
        cur_depth = 0
      end
    end
  end

  dfs = lambda do |list|
    return nil if list.empty?

    kids = list[1...]
    kids.each { |info| info.depth -= 1 }
    kid_root_1, kid_root_2 = kids.filter_map.with_index { |info, i| i if info.depth.zero? }
    if kid_root_1.nil?
      left_kids = right_kids = []
    elsif kid_root_2.nil?
      left_kids = kids
      right_kids = []
    else
      left_kids = kids[kid_root_1...kid_root_2]
      right_kids = kids[kid_root_2..]
    end

    root = TreeNode.new(list[0].value).tap do |r|
      r.left = dfs.call(left_kids)
      r.right = dfs.call(right_kids)
    end
  end

  dfs.call(infos)
end

class Info
  attr_accessor :value, :depth

  def initialize(value, depth)
    @value = value
    @depth = depth
  end
end
