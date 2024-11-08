#!/usr/bin/env ruby
# frozen_string_literal: true

def method
  return to_enum __method__ unless block_given?

  n = 0
  loop do
    n += 1
    yield n**2
  end
end

def method_sans_enum
  n = 0
  loop do
    n += 1
    yield n**2
  end
end

method_enum = to_enum :method_sans_enum

enum = Enumerator.new do |yielder|
  n = 0
  loop do
    n += 1
    yielder.yield(n**2)
  end
end

enum_lazy = Enumerator.new do |yielder|
  n = 0
  loop do
    n += 1
    yielder.yield(n**2)
  end
end.lazy

lazy = (1..Float::INFINITY).lazy.map do |n|
  n**2
end

require 'benchmark/ips'
Benchmark.ips do |bm|
  bm.report('Method') { method.take 50 }
  bm.report('Method Enumerator') { method_enum.take 50 }
  bm.report('Enumerator') { enum.take 50 }
  bm.report('Enumerator Lazy') { enum_lazy.take 50 }
  bm.report('Lazy') { lazy.first 50 }
  bm.compare!
end
