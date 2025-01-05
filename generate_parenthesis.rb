#!/usr/bin/env ruby
# frozen_string_literal: true

# @param n {Integer} Number of parenthesis in each set
# @return {Array<String>} All possible parenthesis sets
def generate_parenthesis(n)
  return [] if n.zero?
  return ['()'] if n == 1

  result = []
  (1..n).each do |i|
    result += generate_parenthesis(i - 1).map { |x| "(#{x})" }
    result += generate_parenthesis(n - i).map { |x| "()#{x}" }
  end
  result
end

# @param n {Integer} Number of parenthesis in each set
# @return {Array<String>} All possible parenthesis sets
def generate_parenthesis2(n)
  return ['()'] if n == 1

  generate_parenthesis2(n - 1).each_with_object(Set.new) do |str, set|
    str.length.times do |i|
      set << str.dup.insert(i, '()')
    end
  end.to_a
end

puts generate_parenthesis(3).inspect
puts generate_parenthesis2(3).inspect
