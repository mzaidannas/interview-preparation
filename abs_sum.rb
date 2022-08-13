#!/usr/bin/env ruby

# Function to calculate minimum
# possible sum of all (arr[i] - b + i)
def MinSum(arr, range)
  # Modify the array
  range.times do |i|
    arr[i] -= (i + 1)
  end

  # sort the array
  arr.sort!

  # calculate median
  b = arr[range / 2]

  # Stores the required answer
  ans = 0
  range.times do |i|
    # Update answer
    ans += (arr[i] - b).abs
  end

  # Return the answer
  ans
end

# Driver code
arr = [1, 5, 2, -2]
range = arr.length
puts(MinSum(arr, range))
