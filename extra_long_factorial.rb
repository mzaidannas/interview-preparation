#!/usr/bin/env ruby
# frozen_string_literal: true

# @param n {Integer} Number to find factorial of
# @return {Integer} Factorial of n
def extra_long_factorial(n, previous = {})
  return n if n <= 1

  ans = (previous[n - 1] || extra_long_factorial(n - 1, previous)) * n
  previous[n] = ans
  ans
end

puts extra_long_factorial(88) # => 185482642257398439114796845645546284380220968949399346684421580986889562184028199319100141244804501828416633516851200000000000000000000
