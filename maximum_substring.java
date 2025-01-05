import java.util.Arrays;

public class MaxSubstring {

    public static String maxSubstring(String[] strings) {
        if (strings == null || strings.length == 0) {
            return "";
        }

        if (strings.length == 1) {
            return strings[0];
        }

        // Find the shortest string
        String shortest = strings[0];
        for (String str : strings) {
            if (str.length() < shortest.length()) {
                shortest = str;
            }
        }

        String maxSub = "";

        for (int i = 0; i < shortest.length(); i++) {
            for (int j = i + 1; j <= shortest.length(); j++) {
                String sub = shortest.substring(i, j);
                boolean isCommon = true;

                for (String str : strings) {
                    if (!str.contains(sub)) {
                        isCommon = false;
                        break;
                    }
                }

                if (isCommon && sub.length() > maxSub.length()) {
                    maxSub = sub;
                }
            }
        }

        return maxSub;
    }
    
    public static void main(String[] args) {
        String[] strings1 = {"flower", "flow", "flight"};
        System.out.println("Max substring (Brute Force): " + maxSubstring(strings1)); // Output: fl
        System.out.println("Max substring (Optimized): " + maxSubstringOptimized(strings1)); // Output: fl

        String[] strings2 = {"dog", "racecar", "car"};
        System.out.println("Max substring (Brute Force): " + maxSubstring(strings2)); // Output: ""
        System.out.println("Max substring (Optimized): " + maxSubstringOptimized(strings2)); // Output: ""

        String[] strings3 = {"apple", "applepie", "applejuice"};
        System.out.println("Max substring (Brute Force): " + maxSubstring(strings3)); // Output: apple
        System.out.println("Max substring (Optimized): " + maxSubstringOptimized(strings3)); // Output: apple

        String[] strings4 = {"c", "acc", "ccc"};
        System.out.println("Max substring (Brute Force): " + maxSubstring(strings4)); // Output: c
        System.out.println("Max substring (Optimized): " + maxSubstringOptimized(strings4)); // Output: c

        String[] strings5 = {};
        System.out.println("Max substring (Brute Force): " + maxSubstring(strings5)); // Output: ""
        System.out.println("Max substring (Optimized): " + maxSubstringOptimized(strings5)); // Output: ""

        String[] strings6 = {"abc"};
        System.out.println("Max substring (Brute Force): " + maxSubstring(strings6)); // Output: abc
        System.out.println("Max substring (Optimized): " + maxSubstringOptimized(strings6)); // Output: abc

        String[] strings7 = {"abab", "aba", "ab"};
        System.out.println("Max substring (Brute Force): " + maxSubstring(strings7)); // Output: ab
        System.out.println("Max substring (Optimized): " + maxSubstringOptimized(strings7)); // Output: ab
    }
}