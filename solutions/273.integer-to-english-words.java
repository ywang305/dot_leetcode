/*
 * @lc app=leetcode id=273 lang=java
 *
 * [273] Integer to English Words
 */

// @lc code=start
class Solution {
    // 单个数字，0，1，2，3，4，5，6，7，8，9
    private static String[] OneNum = {"", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine"};
    // 整十，10，20，30，40，50，60，70，80，90
    private static String[] AnyTen = {"", "Ten", "Twenty", "Thirty", "Forty", "Fifty", "Sixty", "Seventy", "Eighty", "Ninety"};
    // 十几，11，12，13，14，15，16，17，18，19
    private static String[] TenNum = {"Ten", "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen", "Nineteen"};
    // 三位一组，几千，几百万，几十亿
    private static String[] ThreeNum = {"", "Thousand", "Million", "Billion"};

    public String numberToWords(int num) {
        if (num == 0) return "Zero";
        // 每三位一组，比如对于1234567891，在英文里面1,234,567,891表示 1 Billion 234 Million 567 Thousand 891
        StringBuilder sb = new StringBuilder();
        int idx = 3;
        for (int x = 1000000000; x > 0; x /= 1000) {
            if (num / x % 1000 != 0) {
                // 三位一组进行计算，从高到低
                sb.append(calcThreeNum(num / x % 1000)).append(" ").append(ThreeNum[idx]).append(" ");
            }
            idx--;
        }

        return sb.toString().trim();
    }

    private String calcThreeNum(int num) {
        // 计算三位数，比如 001 或者 012 或者 456
        return num / 100 == 0 ? calcTwoNum(num) : calcOneNum(num / 100) + " Hundred" + (num % 100 == 0 ? "" : " " + calcTwoNum(num % 100)) ;
    }

    private String calcTwoNum(int num) {
        // 计算两位数，比如 01 或者 12 或者 23
        if (num >= 10 && num < 20) {
            return TenNum[num % 10];
        }
        return num / 10 == 0 ? calcOneNum(num % 10) : AnyTen[num / 10] + (num % 10 == 0 ? "" : " " + calcOneNum(num % 10));
    }

    private String calcOneNum(int num) {
        // 计算1位数，比如 4
        return OneNum[num];
    }

// 作者：tong-zhu
// 链接：https://leetcode.cn/problems/integer-to-english-words/solution/tong-ge-lai-shua-ti-la-mo-ni-lun-ru-he-x-nakc/
// 来源：力扣（LeetCode）
// 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
}
// @lc code=end

