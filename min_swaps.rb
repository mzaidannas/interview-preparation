#!/usr/bin/env ruby
# frozen_string_literal: true

# Count minimum swap to make string palindrome
# Given a string S, the task is to find out the minimum no of adjacent swaps required to make string s palindrome.
# If it is not possible, then return -1.

def can_be_palindrom(str)
  char_hash = {}
  str.each_char do |char|
    if char_hash.key?(char)
      char_hash.delete(char)
    else
      char_hash[char] = true
    end
  end
  char_hash.length <= 1
end

# Minimum number of adjacent swaps to make a string palindrome
# @param str {String} String to check if it is a palindrome
# @return {Integer} Minimum number of adjacent swaps to make a string palindrome
def min_swaps(str)
  return -1 if str.nil? || str.empty? || !can_be_palindrom(str)

  # Initialize the count of swaps
  count = 0
  left = 0
  right = str.length - 1
  # Loop through the string
  while left < right
    l = left
    r = right
    # If the current left character is not equal to the corresponding right character
    r -= 1 while str[l] != str[r]
    if l == r
      # When we found odd element move towards middle
      str[r], str[r + 1] = str[r + 1], str[r]
      count += 1
      next
    else
      while r < right
        str[r], str[r + 1] = str[r + 1], str[r]
        r += 1
        count += 1
      end
    end
    left += 1
    right -= 1
  end
  # Return the count of minimum swaps
  count
end

puts min_swaps('nttin')
puts min_swaps('ntiin')
puts min_swaps('aabcb')
