#### === Priority Queue =====

# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer[]}
def top_k_frequent(nums, k)
  tally = nums.tally
  num_freq_list = tally.to_a
  quick_select(num_freq_list, 0, num_freq_list.size - 1, k)
  num_freq_list[0...k].map { _1[0] }
end

def quick_select(num_freq_list, s, e, k)
  return if s >= e

  p = s
  pivot = num_freq_list[e][1]
  (s..e).each do |i|
    cur_freq = num_freq_list[i][1]
    if cur_freq >= pivot
      swap(num_freq_list, i, p)
      p += 1
    end
  end
  return quick_select(num_freq_list, s, p - 2, k) if p > k
  return quick_select(num_freq_list, p, e, k) if p < k
end

def swap(container, i, j)
  container[i], container[j] = container[j], container[i]
end
