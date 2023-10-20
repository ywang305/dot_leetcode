/**
Design a data structure that will be initialized with a string array, 
and then it should answer queries of the shortest distance between two different strings from the array.

Implement the WordDistance class:

WordDistance(String[] wordsDict) initializes the object with the strings array wordsDict.
int shortest(String word1, String word2) returns the shortest distance between word1 and word2 in the array wordsDict.

 */

class WordDistance {
    Map<String, TreeSet<Integer>> hash;
    public WordDistance(String[] wordsDict) {
        hash = new HashMap<>();
        for(int i=0; i<wordsDict.length; ++i) {
            var ts = hash.getOrDefault(wordsDict[i], new TreeSet<Integer>());
            ts.add(i);
            hash.put(wordsDict[i], ts);
        }
    }
    
    public int shortest(String word1, String word2) {
        TreeSet<Integer> ts1 = hash.get(word1);
        TreeSet<Integer> ts2 = hash.get(word2);
        int ans = Integer.MAX_VALUE;
        for(var v1 : ts1) {
            var lower = ts2.floor(v1);
            if(lower!=null) ans = Math.min(ans, v1-lower); // 注意 lower 可能是 null
            var upper = ts2.ceiling(v1);
            if(upper!=null) ans = Math.min(ans, upper-v1);
        }
        return ans;
    }
}