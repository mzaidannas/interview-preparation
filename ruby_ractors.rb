#!/usr/bin/env ruby
# frozen_string_literal: true

require 'prime'

# n.prime? with sent integers in r1, r2 run in parallel
r1, r2 = *(1..2).map do
  Ractor.new do
    n = Ractor.recv
    n.prime?
  end
end

# send parameters
r1.send (2**61) - 1
r2.send (2**61) + 15

# wait for the results of expr1, expr2
p r1.take #=> true
p r2.take #=> true
