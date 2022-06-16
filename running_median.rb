#!/usr/bin/env ruby

require 'set'

def runningMedian(a)
  set = SortedSet.new
  puts a.inspect
  # Write your code here
  a.each_with_index do |element, index|
    set << element
    even = ((index + 1) % 2).zero?
    if even
      puts (set[((index) / 2.0).floor,((index) / 2.0).ceil].sum) / 2.0
    else
      puts set[(index / 2).ceil].to_f
    end
  end
end

a_count = gets.strip.to_i

a = Array.new(a_count)

a_count.times do |i|
  a_item = gets.strip.to_i
  a[i] = a_item
end

runningMedian(a)
