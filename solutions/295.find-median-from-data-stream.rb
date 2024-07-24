class MedianFinder
  attr_reader :lq, :rq

  def initialize
    @lq = PriorityQueue.new { _1 > _2 } # max-top heap
    @rq = PriorityQueue.new { _1 < _2 } # min-top heap
  end

  #   :type num: Integer
  #   :rtype: Void
  def add_num(num)
    if rq.empty? || num < rq.next
      lq.push(num.to_f, num)
    else
      rq.push(num.to_f, num)
    end

    if lq.size + 2 == rq.size
      pop = rq.pop
      lq.push(pop, pop)
    elsif lq.size == rq.size + 2
      pop = lq.pop
      rq.push(pop, pop)
    end
  end

  #   :rtype: Float
  def find_median
    return lq.next if lq.size > rq.size
    return rq.next if lq.size < rq.size

    (lq.next + rq.next) / 2
  end
end

# Your MedianFinder object will be instantiated and called as such:
# obj = MedianFinder.new()
# obj.add_num(num)
# param_2 = obj.find_median()
