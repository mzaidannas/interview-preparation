#!/usr/bin/env ruby

def valid_parenthesis(string)
  stack = []
  string.each_char do |char|
    if ['(', '{', '['].include? char
      stack.push(char)
    elsif char == ')' && !stack.empty? && stack.last == '('
      stack.pop
    elsif char == '}' && !stack.empty? && stack.last == '{'
      stack.pop
    elsif char == ']' && !stack.empty? && stack.last == '['
      stack.pop
    else
      return false
    end
  end
  stack.empty?
end

puts valid_parenthesis(gets.chomp)
