#!/usr/bin/env ruby
# frozen_string_literal: true

# Q1. Given a list of strings, count number of pairs of strings where one string is increment of another.
# For eg 'abc', 'bcd'. Each character of 'abc' when incremented gives 'bcd'.
# Edit : it is a list of strings. Ex logins : ["bag","cbh","sfe", "red","cbh"]. In this case there are 3 such pairs
# at indices (0,1), (0,4,), (3,2). This should return 3

# @param logins {Array<String>} List of words
# @return {Integer} Number of pairs of logins that are anagrams of each other
def count_family_logins(logins)
  pairs_count = 0
  hash = Hash.new(0)
  logins.each do |login|
    hash[login] += 1
    next_word = login.each_char.map(&:next).join
    pairs_count += hash[next_word]
  end
  pairs_count
end

logins = []
File.open('family_logins_input.txt', 'r') do |f|
  until (line = f.gets).nil?
    logins << line
  end
end
puts count_family_logins(logins)
