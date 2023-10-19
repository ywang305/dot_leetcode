# https://codeforces.com/problemset/problem/1875/C

def solution(n, m)
  return 0 if n == m || n == 0
  return solution(n % m, m) if n > m
  return -1 if m.odd? || $memo.key?([n, m])

  ans = 0
  until n >= m
    ans += n
    n *= 2
  end

  $memo[[n - m, m]] = nil

  sub_ans = solution(n - m, m)
  $memo[[n - m, m]] = sub_ans != -1 ? ans + sub_ans : -1
end

$memo = {}

# p solution(10,5)
# p solution(1,5)
# p solution(10,4)
# p solution(3,4)
p solution(2, 6)
