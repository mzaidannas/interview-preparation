#!/usr/bin/env ruby
# frozen_string_literal: true

# A word is an anagram of another word if both use the same letters in the same quantity, but arranged differently.

# - anagram('finder', 'Friend') --> true
# - anagram('hello', 'bye') --> false

# Write a function that checks if two provided strings are anagrams of each other; letter casing shouldn’t matter.
# Also, do not consider spaces.

# @param str1 {String} First Word
# @param str2 {String} Second Word
# @return {Boolean} True if the two words are anagrams of each other, false otherwise.
def anagram(str1, str2)
  str1.downcase.chars.sort.join == str2.downcase.chars.sort.join
end

# @param str {String}
# @return {Hash}
def hash_literal(str)
  chars_hash = {}
  str.downcase.gsub(/[^\w]/, '').chars.each do |l|
    chars_hash[l] = chars_hash[l].to_i + 1
  end

  chars_hash
end

# @param str1 {String} First Word
# @param str2 {String} Second Word
# @return {Boolean} True if the two words are anagrams of each other, false otherwise.
def anagram2(str1, str2)
  hash_literal(str1) == hash_literal(str2)
end

puts anagram2('finder', 'Friend')
