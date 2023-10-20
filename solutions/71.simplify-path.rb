#
# @lc app=leetcode id=71 lang=ruby
#
# [71] Simplify Path
#

# @lc code=start
# @param {String} path
# @return {String}
def simplify_path(path)
  stack = []
  path.split('/').each do |dir|
    next if dir.empty? || dir == '.'

    if dir == '..'
      stack.pop
    else
      stack.push(dir)
    end
  end
  '/' + stack.join('/')
end
# @lc code=end
