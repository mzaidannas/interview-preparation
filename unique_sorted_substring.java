import java.util.HashSet;
import java.util.Set;
import java.util.TreeSet;

public class UniqueSubstringsSorted {

    public static Set<String> uniqueSubstringsSorted(String str) {
        if (str == null || str.isEmpty()) {
            return new TreeSet<>(); // Return empty TreeSet for null or empty input
        }

        // Use TreeSet for automatic sorting
        Set<String> uniqueSubstrings = new TreeSet<>();

        for (int i = 0; i < str.length(); i++) {
            for (int j = i + 1; j <= str.length(); j++) {
                uniqueSubstrings.add(str.substring(i, j));
            }
        }

        return uniqueSubstrings;
    }

    public static void main(String[] args) {
        String str1 = "abcabc";
        Set<String> unique1 = uniqueSubstringsSorted(str1);
        System.out.println("Unique substrings of \"" + str1 + "\": " + unique1);
        // Expected output: [a, ab, abc, abca, abcab, abcabc, b, bc, bca, bcab, bcabc, c, ca, cab, cabc]

        String str2 = "aaaa";
        Set<String> unique2 = uniqueSubstringsSorted(str2);
        System.out.println("Unique substrings of \"" + str2 + "\": " + unique2);
        // Expected output: [a, aa, aaa, aaaa]

        String str3 = "";
        Set<String> unique3 = uniqueSubstringsSorted(str3);
        System.out.println("Unique substrings of \"" + str3 + "\": " + unique3);
        // Expected output: []

        String str4 = null;
        Set<String> unique4 = uniqueSubstringsSorted(str4);
        System.out.println("Unique substrings of \"" + str4 + "\": " + unique4);
        // Expected output: []

        String str5 = "banana";
        Set<String> unique5 = uniqueSubstringsSorted(str5);
        System.out.println("Unique substrings of \"" + str5 + "\": " + unique5);
        // Expected output: [a, an, ana, anan, anana, b, ba, ban, bana, banan, banana, n, na, nan, nana]

        String str6 = "cba";
        Set<String> unique6 = uniqueSubstringsSorted(str6);
        System.out.println("Unique substrings of \"" + str6 + "\": " + unique6);
        // Expected output: [a, b, ba, c, cb, cba]
    }
}