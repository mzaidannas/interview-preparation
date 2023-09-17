#!/usr/bin/env ruby

def merge_sort(arr)
  return arr if arr.length <= 1
  mid = arr.length / 2
  left = merge_sort(arr[0...mid])
  right = merge_sort(arr[mid..-1])
  merge(left, right)
end

def merge(left, right)
  result = []
  until left.empty? || right.empty?
    if left[0] < right[0]
      result << left.shift
    else
      result << right.shift
    end
  end
  result + left + right
end

puts merge_sort([5, 3, 4, 2, 1])
