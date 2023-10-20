/**
1762. Buildings With an Ocean View
Medium

There are n buildings in a line. You are given an integer array heights of size n that represents the heights of the buildings in the line.
The ocean is to the right of the buildings. A building has an ocean view if the building can see the ocean without obstructions. 
Formally, a building has an ocean view if all the buildings to its right have a smaller height.
Return a list of indices (0-indexed) of buildings that have an ocean view, sorted in increasing order.

Example 1:

Input: heights = [4,2,3,1]
Output: [0,2,3]
Explanation: Building 1 (0-indexed) does not have an ocean view because building 2 is taller.

 */

class Solution {
    record Rec(int height, int index){}
    
    public int[] findBuildings(int[] heights) {
        Stack<Rec> stack = new Stack<>();
        for(int i=0; i<heights.length; ++i) {
            while(!stack.isEmpty() && stack.peek().height()<=heights[i]) stack.pop();
            stack.push(new Rec(heights[i], i));
        }
        
        int[] ans = new int[stack.size()];
        for(int i=0; i<stack.size(); ++i) ans[i] = stack.get(i).index();
        return ans;
    }
}

