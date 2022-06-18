#!/usr/bin/env ruby

require 'algorithms'
include Containers

def runningMedian(a)
  min_heap = MinHeap.new
  max_heap = MaxHeap.new
  # Write your code here
  a.each do |element|
    max_heap.push(element.to_f)
    if max_heap.size > 1 && min_heap.size > 1 && (max_heap.max > min_heap.min)
      min_heap.push(max_heap.max!)
    end
    if max_heap.size > min_heap.size + 1
      min_heap.push(max_heap.max!)
    elsif min_heap.size > max_heap.size + 1
      max_heap.push(min_heap.min!)
    end
    if max_heap.size > min_heap.size
      puts max_heap.max
      next
    elsif min_heap.size > max_heap.size
      puts min_heap.min
      next
    end
    puts (max_heap.max + min_heap.min) / 2
  end
end

File.open('running_median_input.txt', 'r') do |f|
  a_count = f.gets.strip.to_i

  a = Array.new(a_count)

  a_count.times do |i|
    a_item = f.gets.strip.to_i
    a[i] = a_item
  end

  runningMedian(a)
end
