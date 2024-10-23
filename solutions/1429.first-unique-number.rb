class FirstUnique
  =begin
      :type nums: Integer[]
  =end
      def initialize(nums)
          @key_to_node = {}
          @dummy = Node.new(-1)
          @dummy.pre = @dummy.nex = @dummy
          @counts = Hash.new { |h,k| h[k]=0 }

          nums.each do |num|
              add(num)
          end
      end


  =begin
      :rtype: Integer
  =end
      def show_first_unique()
          @dummy.nex.value
      end


  =begin
      :type value: Integer
      :rtype: Void
  =end
      def add(value)
          @counts[value] += 1
          if @counts[value] == 1
              node = Node.new(value)
              @key_to_node[value] = node
              insert(node)
          end
          if @counts[value]>1 && @key_to_node.key?(value)
              node = @key_to_node[value]
              delete(node)
              @key_to_node.delete(value)
          end
      end

      private

      class Node
          attr_accessor :value, :pre, :nex

          def initialize(value, pre = nil, nex = nil)
              @value = value
              @pre = pre
              @nex = nex
          end
      end

      def insert(node) # to tail
          tail = @dummy.pre
          tail.nex = node
          @dummy.pre = node
          node.nex = @dummy
          node.pre = tail
      end

      def delete(node)
          nex = node.nex
          pre = node.pre
          node.nex = node.pre = nil
          pre.nex = nex
          nex.pre = pre
      end
  end

  # Your FirstUnique object will be instantiated and called as such:
  # obj = FirstUnique.new(nums)
  # param_1 = obj.show_first_unique()
  # obj.add(value)
  #
  #
  #
  #给定一系列整数，插入一个队列中，找出队列中第一个唯一整数。

# 实现 FirstUnique 类：

# FirstUnique(int[] nums) 用数组里的数字初始化队列。
# int showFirstUnique() 返回队列中的 第一个唯一 整数的值。如果没有唯一整数，返回 -1。（译者注：此方法不移除队列中的任何元素）
# void add(int value) 将 value 插入队列中。


# 示例 1：

# 输入：
# ["FirstUnique","showFirstUnique","add","showFirstUnique","add","showFirstUnique","add","showFirstUnique"]
# [[[2,3,5]],[],[5],[],[2],[],[3],[]]
# 输出：
# [null,2,null,2,null,3,null,-1]
# 解释：
# FirstUnique firstUnique = new FirstUnique([2,3,5]);
# firstUnique.showFirstUnique(); // 返回 2
# firstUnique.add(5);            // 此时队列为 [2,3,5,5]
# firstUnique.showFirstUnique(); // 返回 2
# firstUnique.add(2);            // 此时队列为 [2,3,5,5,2]
# firstUnique.showFirstUnique(); // 返回 3
# firstUnique.add(3);            // 此时队列为 [2,3,5,5,2,3]
# firstUnique.showFirstUnique(); // 返回 -1
