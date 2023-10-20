/**
Design an iterator to flatten a 2D vector. It should support the next and hasNext operations.

Implement the Vector2D class:

Vector2D(int[][] vec) initializes the object with the 2D vector vec.
next() returns the next element from the 2D vector and moves the pointer one step forward. You may assume that all the calls to next are valid.
hasNext() returns true if there are still some elements in the vector, and false otherwise.
 

Example 1:

Input
["Vector2D", "next", "next", "next", "hasNext", "hasNext", "next", "hasNext"]
[[[[1, 2], [3], [4]]], [], [], [], [], [], [], []]
Output
[null, 1, 2, 3, true, true, 4, false]

Explanation
Vector2D vector2D = new Vector2D([[1, 2], [3], [4]]);
vector2D.next();    // return 1
vector2D.next();    // return 2
vector2D.next();    // return 3
vector2D.hasNext(); // return True
vector2D.hasNext(); // return True
vector2D.next();    // return 4
vector2D.hasNext(); // return False


 */

class Vector2D {
    int outer = 0;
    int inner = 0;
    int[][] vec;
    
    public Vector2D(int[][] vec) {
        this.vec = vec;
    }
    
    public int next() {
        while(vec[outer].length == inner) {
            outer++;
            inner=0;
        }
        return vec[outer][inner++];
    }
    
    public boolean hasNext() {
        if(outer==vec.length) return false;
        if(inner == vec[outer].length) {
            outer++;
            inner = 0;
            return hasNext();
        }
        return true;
    }
}