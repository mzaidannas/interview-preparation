import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

public class MaxSubstringLength {

    public static int maxSubstringLength(String[] strings) {
        if (strings == null || strings.length == 0) {
            return 0;
        }

        if (strings.length == 1) {
            return strings[0].length();
        }

        // Find the shortest string, as the common substring can't be longer than it.
        String shortest = strings[0];
        for (String str : strings) {
            if (str.length() < shortest.length()) {
                shortest = str;
            }
        }

        int maxLength = 0;

        // Iterate through all possible substrings of the shortest string.
        for (int i = 0; i < shortest.length(); i++) {
            for (int j = i + 1; j <= shortest.length(); j++) {
                String sub = shortest.substring(i, j);
                boolean isCommon = true;

                // Check if the current substring is present in all other strings.
                for (String str : strings) {
                    if (!str.contains(sub)) {
                        isCommon = false;
                        break;
                    }
                }

                if (isCommon) {
                    maxLength = Math.max(maxLength, sub.length());
                }
            }
        }

        return maxLength;
    }

    //Optimized Approach using Binary Search
    public static int maxSubstringLengthOptimized(String[] strings) {
        if (strings == null || strings.length == 0) {
            return 0;
        }

        if (strings.length == 1) {
            return strings[0].length();
        }

        String shortest = strings[0];
        for (String str : strings) {
            if (str.length() < shortest.length()) {
                shortest = str;
            }
        }

        int low = 0;
        int high = shortest.length();
        int maxLength = 0;

        while (low <= high) {
            int mid = low + (high - low) / 2;
            if (isCommonSubstring(strings, shortest, mid)) {
                maxLength = mid;
                low = mid + 1; // Try for longer substrings
            } else {
                high = mid - 1; // Try for shorter substrings
            }
        }
        return maxLength;
    }

    private static boolean isCommonSubstring(String[] strings, String shortest, int len) {
        if (len == 0) return true; // Empty string is always a common substring
        for (int i = 0; i <= shortest.length() - len; i++) {
            String sub = shortest.substring(i, i + len);
            boolean isPresentInAll = true;
            for (String str : strings) {
                if (!str.contains(sub)) {
                    isPresentInAll = false;
                    break;
                }
            }
            if (isPresentInAll) return true;
        }
        return false;
    }



    public static void main(String[] args) {
        String[] strings1 = {"flower", "flow", "flight"};
        System.out.println("Max substring length (Brute Force): " + maxSubstringLength(strings1)); // Output: 3
        System.out.println("Max substring length (Optimized): " + maxSubstringLengthOptimized(strings1)); // Output: 3

        String[] strings2 = {"dog", "racecar", "car"};
        System.out.println("Max substring length (Brute Force): " + maxSubstringLength(strings2)); // Output: 0
        System.out.println("Max substring length (Optimized): " + maxSubstringLengthOptimized(strings2)); // Output: 0


        String[] strings3 = {"apple", "applepie", "applejuice"};
        System.out.println("Max substring length (Brute Force): " + maxSubstringLength(strings3)); // Output: 5
        System.out.println("Max substring length (Optimized): " + maxSubstringLengthOptimized(strings3)); // Output: 5

        String[] strings4 = {"c", "acc", "ccc"};
        System.out.println("Max substring length (Brute Force): " + maxSubstringLength(strings4)); // Output: 1
        System.out.println("Max substring length (Optimized): " + maxSubstringLengthOptimized(strings4)); // Output: 1

        String[] strings5 = {};
        System.out.println("Max substring length (Brute Force): " + maxSubstringLength(strings5)); // Output: 0
        System.out.println("Max substring length (Optimized): " + maxSubstringLengthOptimized(strings5)); // Output: 0

        String[] strings6 = {"abc"};
        System.out.println("Max substring length (Brute Force): " + maxSubstringLength(strings6)); // Output: 3
        System.out.println("Max substring length (Optimized): " + maxSubstringLengthOptimized(strings6)); // Output: 3
    }
}