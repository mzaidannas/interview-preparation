#!/usr/bin/env ruby
# frozen_string_literal: true

# An industrial company has N factories, each producing some pollution every month.
# The company has decided to reduce its total fume emissions by equipping some of the factories with one or more filters.
# Every such filter reduces the pollution of a factory by half.
# When a second (or subsequent) filter is applied, it again reduces by half the remaining pollution emitted after fitting the existing filter(s).
# For example, a factory that initially produces 6 units of pollution will generate 3 units with one filter,
# 1.5 units with two filters and 0.75 units with three filters.

# You are given an array of N integers describing the amount of pollution produced by the factories.
# Your task is to find the minimum number of filters needed to decrease the total sum of pollution by at least half.
# Write a function:
#     class Solution { public int solution(int[] A); )
# which, given an array of integers A of length N, returns the minimum number of filters needed to reduce the total pollution by at least half.

# Examples:
# 1. Given A = [5, 19, 8, 1], your function should return 3.
# The initial total pollution is 5 + 19 + 8 + 1 = 33. We install two filters at the factory producing 19 units and one filter at the factory producing 8 units. Then the total pollution will be 5 + ((19 / 2) / + (8 / 2) + 1 = 5 + 4.75 + 4 + 1 = 14.75 which is less than 33 / 2 = 16.5, so we have achieved our goal.

# 2. Given A = [10, 10], your function should return 2,
# because we may install one filter at each factory.

# 3. Given A = [3, 0, 5], your function should return 2
# because it is sufficient to install one filter at each factory producing a non-zero amount of pollution.

def industrial_pollution(pollutions)
  total_pollution = pollutions.inject(:+)
  half_pollution = total_pollution / 2.0

  filters = 0
  pollutions.sort! { |a, b| b <=> a }
  while total_pollution > half_pollution
    index = 0
    pollutions[index] = pollutions[index] / 2.0
    total_pollution -= pollutions[index]
    filters += 1
    while total_pollution > half_pollution && index < pollutions.length - 1 && pollutions[index] < pollutions[index + 1]
      temp = pollutions[index]
      pollutions[index] = pollutions[index + 1]
      pollutions[index + 1] = temp
      index += 1
    end
  end
  filters
end

puts industrial_pollution([5, 19, 8, 1])
puts industrial_pollution([10, 10])
puts industrial_pollution([3, 0, 5])
