/*
 * @lc app=leetcode id=1249 lang=java
 *
 * [1249] Minimum Remove to Make Valid Parentheses
 */

// @lc code=start
class Solution {
    record Rec(char c, int index) {}

    public String minRemoveToMakeValid(String s) {
        int left = 0, right = 0;
        Stack<Rec> stack = new Stack<>();
        for(int i=0; i<s.length(); ++i) {
            char c = s.charAt(i);
            if(c=='(') {
                stack.push(new Rec(c, i));
            } else if(c==')') {
                if(!stack.isEmpty() && stack.peek().c()=='(') {
                    stack.pop();
                } else {
                    stack.push(new Rec(c, i));
                }
            }
        }
        
        StringBuilder sb = new StringBuilder();
        Set<Integer> set = stack.stream().map(Rec::index).collect(Collectors.toSet());
        for(int i=0; i<s.length(); ++i) {
            if(set.contains(i)) continue;
            sb.append(s.charAt(i));
        }
        return sb.toString();
    }
}
// @lc code=end

