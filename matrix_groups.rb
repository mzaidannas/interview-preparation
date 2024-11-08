#!/usr/bin/env ruby
# frozen_string_literal: true

def count_groups(related)
  num = 0
  (1..related.size - 1).each do |times|
    i = times - 1
    while i >= 0
      if related[i][times] == 1 && related[times][i] == 1
        related[i][times] = 0
        related[times][i] = 0
        num += 1
      end
      i -= 1
    end
  end
  num.zero? ? related.size : num
end

puts count_groups([[1, 1, 0, 0, 0],
                   [1, 1, 0, 0, 0],
                   [0, 0, 1, 1, 0],
                   [0, 0, 1, 1, 0],
                   [0, 0, 0, 0, 1]])

puts count_groups([[1, 0, 0, 0, 0],
                   [0, 1, 0, 0, 0],
                   [0, 0, 1, 0, 0],
                   [0, 0, 0, 1, 0],
                   [0, 0, 0, 0, 1]])
