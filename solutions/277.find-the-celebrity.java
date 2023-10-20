/*
PD:  https://leetcode.ca/all/277.html
*/

/* The knows API is defined in the parent class Relation.
      boolean knows(int a, int b); */

public class Solution extends Relation {
    public int findCelebrity(int n) {
        int candidate = 0;
        for(int i=1; i<n; ++i) {
          //题目中说如果有解则一定存在仅一个celebrity, 第一步找出这样的candidate
            if(knows(candidate, i)) candidate = i;
        }
        for(int i=0; i<n; ++i) {
          // 检查candidate是否真的是 celebrity
            if(i==candidate) continue;
            if(knows(candidate, i) || !knows(i, candidate)) return -1;
        }
        return candidate;
    }
}