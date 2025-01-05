#!/usr/bin/env ruby
# frozen_string_literal: true

def integer_to_roman(num)
  roman = ''
  roman_hash = {
    1000 => 'M',
    900 => 'CM',
    500 => 'D',
    400 => 'CD',
    100 => 'C',
    90 => 'XC',
    50 => 'L',
    40 => 'XL',
    10 => 'X',
    9 => 'IX',
    5 => 'V',
    4 => 'IV',
    1 => 'I'
  }
  roman_hash.each do |key, value|
    roman << (value * (num / key))
    num %= key
  end
  roman
end

p integer_to_roman(154)
