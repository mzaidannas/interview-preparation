#!/usr/bin/env ruby

# Given an array of strings, group anagrams together.

# For example, given: ["eat", "tea", "tan", "ate", "nat", "bat"],
# Return:

# [
#   ["ate", "eat","tea"],
#   ["nat","tan"],
#   ["bat"]
# ]
# Note: All inputs will be in lower-case.

# @param str {String}
# @return {Hash}
def hash_literal(str)
  chars_hash = {}
  str.chars.each do |l|
    chars_hash[l] = chars_hash[l].to_i + 1
  end

  chars_hash
end

# @param words {Array<String>} An array of strings
# @return {Array<Array<String>>} An array of array strings grouped by anagrams
def group_anagrams2(words)
  groups = {}
  words.sort.each do |word|
    hash = hash_literal(word)
    groups[hash] ||= []
    groups[hash] << word
  end
  groups.values.sort_by { |arr| -arr.length }
end

def group_anagrams(words)
  words.group_by { |word| word.chars.sort }.values
end

puts group_anagrams2(%w[eat tea tan ate nat bat]).inspect
