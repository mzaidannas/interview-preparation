#!/usr/bin/env ruby
# frozen_string_literal: true

# The distance between two array values is the number of indices between them. Given a, find the minimum distance between any pair of equal elements in the array. If no such value exists, return -1.

# Example

# a = [3, 2, 1, 2, 3]

# There are two matching pairs of values: 3 and 2.
# The indices of the 3's are i = 0 and j = 4, so their distance is d[i, j] = |j - i| = 4.
# The indices of the 2's are i = 1 and j = 3, so their distance is d[i, j] = |j - i| = 2.
# The minimum distance is 2.

# Function Description

# Complete the minimumDistances function in the editor below.

# minimumDistances has the following parameter(s):

# int a[n]: an array of integers
# Returns

# int: the minimum distance found or  if there are no matching elements
# Input Format

# The first line contains an integer n, the size of array a.
# The second line contains n space-separated integers a[i].

# Constraints

# 1 <= n <= 10^3
# 1 <= a[i] <= 10^5

# Output Format

# Print a single integer denoting the minimum d[i, j] in a. If no such value exists, print -1.

# @param a {Integer[]} the array of integers
# @return {Integer} the minimum distance found or -1 if there are no matching elements
def minimum_distance(a)
  minimum_distance = Float::INFINITY
  index_hash = {}
  a.each_with_index do |num, current_index|
    if index_hash.key?(num)
      current_distance = current_index - index_hash[num]
      minimum_distance = current_distance if current_distance < minimum_distance
    end
    index_hash[num] = current_index
  end
  minimum_distance == Float::INFINITY ? -1 : minimum_distance
end

a = nil
File.open('minimum_distance_input.txt', 'r') do |f|
  a = f.gets.rstrip.split.map(&:to_i)
end
puts minimum_distance(a) # => 8
