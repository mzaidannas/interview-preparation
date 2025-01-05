#!/usr/bin/env ruby
# frozen_string_literal: true

def merge_sort(arr)
  return arr if arr.length <= 1

  mid = arr.length / 2
  left = merge_sort(arr[0...mid])
  right = merge_sort(arr[mid..])
  merge(left, right)
end

def merge(left, right)
  result = []
  until left.empty? || right.empty?
    result << if left[0] < right[0]
                left.shift
              else
                right.shift
              end
  end
  result + left + right
end

puts merge_sort([5, 3, 4, 2, 1])
