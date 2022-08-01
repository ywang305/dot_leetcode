/*
 * @lc app=leetcode id=218 lang=java
 *
 * [218] The Skyline Problem
 */

// @lc code=start
class Solution {
    class Point {
        int x;
        int y;
        boolean isLeft;
        public Point(int x, int y, boolean isLeft) {
            this.x = x; this.y = y; this.isLeft = isLeft;
        }
    }
    public List<List<Integer>> getSkyline(int[][] buildings) {
        Set<Point> tree = new TreeSet<>((a,b)->{
            if(a.x==b.x) { // 如果横坐标相同
                if(a.isLeft && b.isLeft) return a.y-b.y; //如果相同的左端点，则按低-高排序
                if(a.isLeft) return -1; // 左端点排先
                if(b.isLeft) return 1;  // ..
                return b.y-a.y; //否则相同的右端点，则按高-低排序
            }
            return a.x - b.x; // 按照横坐标进行排序
        });
        for(var build : buildings) {
            int left = build[0], right = build[1], height=build[2];
            tree.add( new Point(left, height, true) );
            tree.add( new Point(right, height, false));
        }
        Queue<Integer> maxQ = new PriorityQueue<>((a,b)->b-a);// 大根堆
        int preHieght = 0;
        List<List<Integer>> res = new ArrayList<>();

        maxQ.offer(0); // 考点 ：「右下角」那个点也取到
        for(var p : tree) {
            if(p.isLeft) {// 如果是左端点，说明存在一条往右延伸的可记录的边，将高度存入优先队列
                maxQ.offer(p.y);
            } else {// 如果是右端点，说明这条边结束了，将当前高度从队列中移除
                maxQ.remove(p.y);
            }
            // 取出最高高度，如果当前不与前一矩形“上边”延展而来的那些边重合，则可以被记录
            if(maxQ.peek()!=preHieght) {
                preHieght = maxQ.peek();
                if (res.size()>0 && res.get(res.size()-1).get(0) == p.x) {
                    res.get(res.size()-1).set(1, preHieght); // 相同横坐标 则更新高度
                } else {
                    res.add(Arrays.asList(p.x, preHieght));
                }
            }
        }
        return res;
    }
}
// @lc code=end

