#!/usr/bin/env ruby
# frozen_string_literal: true

# BinaryGap: Find longest sequence of zeros in binary representation of an integer.

# A binary gap within a positive integer N is any maximal sequence of consecutive zeros
# that is surrounded by ones at both ends in the binary representation of N.

# For example:
# The number 9 has binary representation 1001 and contains a binary gap of length 2.
# The number 529 has binary representation 1000010001 and contains two binary gaps one of length 4 and one of length 3.
# The number. has binary representation 10100 and contains one binary gap of length 1.
# The number 15 has binary representation 1111 and has no binary gaps.
# The number 32 has binary representation 100000 and has no binary gaps.

# Write function:
#   def solution(n)

# That, given a positive integer N, returns. length of its longest binary gap.
# The function should return 0 if N doesn't contain a binary gap.

# For example:

# Given N = 1041 the function should return 5, because N has binary representation '10000010001'
# and so its longest binary gap is of length 5.

# Given N = 32 the function should return 0, because N has binary representation '1000OO' and thus no binary gaps.

# Write an efficient algorithm the following assumptions:
# • N is an integer within the range [1..2,147,483,647]

def binary_gap(num)
  binary = num.to_s(2)
  current_gap = max_gap = 0
  binary.each_char do |char|
    if char == '1'
      current_gap = 0
    else
      current_gap += 1
    end
    max_gap = current_gap if current_gap >= max_gap
  end

  max_gap
end

binary_gap(182)
