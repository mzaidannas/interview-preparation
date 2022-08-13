#!/usr/bin/env ruby

# Given a list servers. Their processing power is given as an array of integers, and boot power as an array of integers.
# Write a function to return the max length of sub array which's power consumption is less than or equal to max power limit.
# Formula to calculate the power consumption for a subArray is:
# Max(bootPower[i...j]) + Sum(processPower[i....j]) * length of subArray.

# NOTE: Single server is also a subArray, return 0 if no such subArray can be found.

# @param processingPower {Array<Integer>} List of processing power of processors
# @param bootingPower {Array<Integer>} List of booting power of processors
# @param maxPower {Integer} Maximum power limit we can afford
# @return {Integer} Maximum processors that falls into maxPower limit
def processing_power(processingPower, bootingPower, maxPower)
  size = processingPower.length
  i = 0
  j = 0

  queue = []
  sum = 0
  ans = 0

  while j < size
    sum += processingPower[j]
    queue.shift while !queue.empty? && queue.first[0] <= bootingPower[j]
    queue.unshift([bootingPower[j], j])

    while i <= j && queue.last[0] + sum * (j - i + 1) > maxPower
      queue.pop if queue.last[1] == i
      sum -= processingPower[i]
      i += 1
    end
    ans = [ans, j - i + 1].max
    j += 1
  end
  ans
end

puts processing_power([4, 1, 4, 5, 3], [8, 8, 10, 9, 12], 10)
