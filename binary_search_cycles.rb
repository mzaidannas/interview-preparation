#!/usr/bin/env ruby

def binary_search_cycles(arr, val)
  l = 0
  r = arr.length - 1
  while l <= r
    mid = (l + r) / 2
    if arr[mid] == val
      return mid
    elsif arr[mid + 1] <= arr[r]
      if val <= arr[r] && val >= arr[mid + 1]
        l = mid + 1
      else
        r = mid - 1
      end
    elsif arr[l] <= arr[mid - 1]
      if val <= arr[mid - 1] && val >= arr[l]
        r = mid - 1
      else
        l = mid + 1
      end
    end
  end
  return -1
end

puts binary_search_cycles([3, 4, 5, 6, 7, 1, 2], 2)
