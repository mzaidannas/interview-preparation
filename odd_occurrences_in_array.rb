#!/usr/bin/env ruby
# frozen_string_literal: true

# OddOccurrencesInArray:
# Find value that occurs in odd number of elements

# A non-empty array A consisting of N integers is given. The array contains an odd
# number of elements, and each element of the array can be paired with another
# element that has the same value except for one element that left unpaired.

# For example, in array A such that:
# A[0] = 9, A[1] = 3, A[2] = 9
# A[3] = 9, A[4] = 9, A[5] = 7
# A[6] = 9

# . the elements at indexes 0 and 2 have value 9
# . the elements at indexes 1 and 3 have value 3
# . the elements at indexes 4 and 6 have value 9
# . the element at index 5 has value 7 and is unpaired

# Wite a function
# def solution(a)
# that, given an array A consisting of integers N integers fulfilling the above conditions, returns
# the value of the unpaired element.

# For example given array A such that
# A[0] = 9, A[1] = 3, A[2] = 9
# A[3] = 9, A[4] = 9, A[5] = 7
# A[6] = 9

# the function should return 7, as explained in the example above.
# Write an efficient algorithm for the following assumptions

# . N is an odd integer within the range [1..1,000,000]
# . each element of array A is an integer within the range [1..1,000,000,000]
# . all but one of the values in A occur an even number of times

def odd_occurrences_in_array(array)
  # Detect EXCLUSIVE OR between each element of the array. If the result is 0, then the element is even.
  array.inject(:^)
end

def odd_occurrences_in_array2(array)
  hash = {}
  array.each do |num|
    if hash[num].nil?
      hash[num] = true
    else
      hash.delete(num)
    end
  end
  hash.keys.first
end

puts odd_occurrences_in_array([9, 3, 9, 3, 9, 7, 9])
puts odd_occurrences_in_array2([9, 3, 9, 3, 9, 7, 9])
