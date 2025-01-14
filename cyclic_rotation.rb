#!/usr/bin/env ruby
# frozen_string_literal: true

# CyclicRotation
#
# Task description:
#
# An array A consisting of N integers is given. Rotation of the array means that each
# element is shifted right by one index, and the last element of the array is moved to the
# first place. For example, the rotation of array A=[3, 8, 9, 7, 6] is [6, 5, 8, 9, 7]
# (elements are shifted right by one index and 6 is moved to the first place)

# The goal is to rotate array AKC times, that is, each element of A will be shifted to the
# right K times
# Write a function:
# def solution(a, k)
# that, given an array A consisting of Nintegers and an integer K, returns the array A
# For example given

# A = [3, 8, 9, 7, 6]
# K = 3

# the function should return (9, 7, 6, 3, 8). Three rotations were made

# [3, 8, 9, 7, 6] -> [6, 3, 8, 9, 7]
# [6, 3, 8, 9, 7] -> [7, 6, 3, 8, 9]
# [7, 6, 3, 8, 9] -> [9, 7, 6, 3, 8]

# For another example, given

# A = [0, 0, 0]
# K = 1
# the function should return [0,0,0]

# Given
# A = [1, 2, 3, 4]
# K = 4
# the function should return [1,2,3,4]
# Assume that
# .N and K are integers within range [0..100]
# .each element of array A is an integer within the range [-1,000, 1,000]

def cyclic_rotation(array, rotations)
  return array if array.empty? || rotations <= 0

  rotations %= array.length
  return array if rotations.zero?

  rotations = array.length - rotations
  new_array = []

  array.length.times do
    new_array << array[rotations]
    rotations = (rotations + 1) % array.length
  end
  new_array
end

puts cyclic_rotation([1, 2, 3, 4, 5], 1).inspect
puts cyclic_rotation([1, 2, 3, 4, 5], 2).inspect
puts cyclic_rotation([1, 2, 3, 4, 5], 3).inspect
puts cyclic_rotation([1, 2, 3, 4, 5], 4).inspect
puts cyclic_rotation([1, 2, 3, 4, 5], 5).inspect
