#
# @lc app=leetcode id=225 lang=ruby
#
# [225] Implement Stack using Queues
#

# @lc code=start
class MyStack
  def initialize
    @queue = []
  end

  #     :type x: Integer
  #     :rtype: Void
  def push(x)
    @queue << x
  end

  #     :rtype: Integer
  def pop
    @queue.pop
  end

  #     :rtype: Integer
  def top
    @queue.last
  end

  #     :rtype: Boolean
  def empty
    @queue.empty?
  end
end

# Your MyStack object will be instantiated and called as such:
# obj = MyStack.new()
# obj.push(x)
# param_2 = obj.pop()
# param_3 = obj.top()
# param_4 = obj.empty()
# @lc code=end
