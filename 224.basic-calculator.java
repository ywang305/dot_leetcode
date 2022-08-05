/*
 * @lc app=leetcode id=224 lang=java
 *
 * [224] Basic Calculator
 */

// @lc code=start
class Solution {
    public int calculate(String s) {
        Deque<Character> ops = new ArrayDeque<>();
        Deque<Integer> nums = new ArrayDeque<>();
        
        s = s.replaceAll(" ", "");
        int n = s.length();
        
        for(int i=0; i<n; ++i) {
            char c = s.charAt(i);
            if(c=='(') {
                ops.addLast(c);
            } else if(c==')') {
                if(!ops.isEmpty() && ops.peekLast()!='(') calc(ops, nums); // 清算一次 一定是case (a op b), (a)
                ops.pollLast(); // 记住将'('也出栈
            } else if(Character.isDigit(c)) {
                int num = 0;
                int j=i;
                while(j<n && Character.isDigit(s.charAt(j))) num = num*10+s.charAt(j++)-'0';
                i = j-1; // i跳到最后一位数字处(因为最后还会增加1)
                nums.addLast(num);
            } else { // '+' or '-'
            /* 
                +/-前填0的情况:
                (1)开头若为'-', 如 -3...   =>  0-3...  
                (2)前一位'('，这个添0：(-3) => (0-3),  其他比如 ...)+2 则+前不填 0， 
            */
                if(i==0 || s.charAt(i-1)=='(') nums.addLast(0);
                while(!ops.isEmpty() && ops.peekLast()!='(') calc(ops, nums); // 清算一波
                ops.addLast(c);
            }
        }
        // 最后再进行一次最外层数字的计算，表示没有括号包住的数字
        while(!ops.isEmpty()) calc(ops, nums);
        return nums.peekLast();
    }
    
    void calc(Deque<Character> ops, Deque<Integer> nums) {
        if(nums.isEmpty() || nums.size()<2) return;
        char op = ops.pollLast();
        int n2 = nums.pollLast(), n1 = nums.pollLast();
        nums.addLast(op=='+'? n1+n2 : n1-n2);
    }
}
// @lc code=end

