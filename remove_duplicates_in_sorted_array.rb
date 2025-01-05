#!/usr/bin/env ruby
# frozen_string_literal: true

def remove_duplicates_in_sorted_array(arr)
  j = 1
  previous = arr[0]
  arr[1..].each_with_index do |num, _i|
    next unless num != previous

    previous = num
    arr[j] = num
    j += 1
  end
  arr[..j - 1]
end

puts remove_duplicates_in_sorted_array([1, 2, 2, 2, 2, 2, 3, 4, 5, 5, 6]).inspect
