#!/usr/bin/env ruby

# There is a string, , of lowercase English letters that is repeated infinitely many times. Given an integer, , find and print the number of letter a's in the first  letters of the infinite string.

# Example
# s = 'abcac'
# n = 10

# The substring we consider is abcacabcac, the first 10 characters of the infinite string. There are  occurrences of a in the substring.

# Function Description

# Complete the repeatedString function in the editor below.

# repeatedString has the following parameter(s):

# s: a string to repeat
# n: the number of characters to consider
# Returns
# int: the frequency of a in the substring

# Input Format

# The first line contains a single string, .
# The second line contains an integer, .

# Constraints

# For  of the test cases, .

# @param s {String} the string to repeat
# @param n {Integer} the number of characters to consider
# @return {Integer} the frequency of a in the substring
def repeated_string(s, n)
  count_a = 0
  s.each_char do |char|
    count_a += 1 if char == 'a'
  end
  times, remaining = n.divmod(s.length)
  count_a *= times
  remaining.times do |index|
    count_a += 1 if s[index] == 'a'
  end
  count_a
end

puts repeated_string('afcfffaged', 962_645_758_455) # => 192529151691
