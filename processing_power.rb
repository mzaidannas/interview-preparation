#!/usr/bin/env ruby
# frozen_string_literal: true

# Given a list servers. Their processing power is given as an array of integers, and boot power as an array of integers.
# Write a function to return the max length of sub array which's power consumption is less than or equal to max power limit.
# Formula to calculate the power consumption for a subArray is:
# Max(booting_power[i...j]) + Sum(processing_power[i....j]) * length of subArray.

# NOTE: Single server is also a subArray, return 0 if no such subArray can be found.

# @param processing_power {Array<Integer>} List of processing power of processors
# @param booting_power {Array<Integer>} List of booting power of processors
# @param max_power {Integer} Maximum power limit we can afford
# @return {Integer} Maximum processors that falls into max_power limit
def max_processing_power(processing_power, booting_power, max_power)
  result = 0
  l = 0
  r = 0
  sum_val = 0 # Help store the cumulative sum in the sliding window
  window = [] # Array as deque. Help extract max value in the sliding window

  while r < booting_power.length
    # Clear smaller values before appending the new value
    window.pop while !window.empty? and window[-1] < booting_power[r]
    # Append new value, expand the sliding window
    window.append(booting_power[r])
    # Get the max val in the curr sliding window from deque
    max_val = window[0]
    sum_val += processing_power[r]
    r += 1 # Move forward the right pointer
    consmp = max_val + sum_val * (r - l)

    # Shrink the window when consmp bigger than the threshold
    while consmp > max_power
      # Pop the left element from deque
      # If head of deque isn't equal to lth element, it means that lth element is already popped out
      window.shift if window[0] == booting_power[l]
      max_val = window[0]
      sum_val -= processing_power[l]
      l += 1 # Move forward the left pointer
      consmp = max_val + sum_val * (r - l)
    end
    # Consmp is no bigger than the max_power, satisfying the condition, update the max length
    result = [result, r - l].max
  end
  result
end

puts max_processing_power([1, 2, 3, 4, 5], [1, 2, 3, 4, 5], 10) # => 2
puts max_processing_power([2, 1, 3, 4, 5], [3, 6, 1, 3, 4], 25) # => 3
