#!/usr/bin/env ruby
# frozen_string_literal: true

def unique_subsets(nums)
  # Write your code here
  (0..nums.length).collect do |i|
    nums.combination(i).to_a
  end.flatten(1).reject(&:empty?)
end

puts unique_subsets([1, 2, 3]).inspect
