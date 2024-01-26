from typing import List


class Solution:
    def evalRPN(self, tokens: List[str]) -> int:
        from collections import deque as stack

        stack = []
        ops = {
            '+': lambda a,b: a+b,
            '-': lambda a,b: a-b,
            '*': lambda a,b: a*b,
            '/': lambda a,b: int(a/b)
        }
        for t in tokens:
            if t in ops:
                b, a = stack.pop(), stack.pop()
                stack.append(ops[t](a,b))
            else:
                stack.append(int(t))
        return stack.pop()
