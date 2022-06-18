#!/usr/bin/env ruby

def contacts(queries)
  finds = []
  prefix_counts = Hash.new(0)
  queries.each do |query|
    operation, str = query
    if operation == 'add'
      0..str.length.times do |i|
        prefix_counts[str[0..i]] += 1
      end
    else
      finds << prefix_counts[str]
    end
  end
  finds
end

File.open('contacts_input.txt', 'r') do |f|
  queries_rows = f.gets.strip.to_i

  queries = Array.new(queries_rows)

  queries_rows.times do |i|
    queries[i] = f.gets.rstrip.split
  end

  puts contacts(queries).join("\n")
end
