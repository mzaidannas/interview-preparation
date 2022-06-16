#!/usr/bin/env ruby

def contacts(queries)
  find_hash = {}
  names = []
  results = Array.new(queries.size, 0)
  queries.each do |query|
    operation, str = query
    if operation == 'add'
      names << str
    else
      find_hash[str] ||= { size: 0, last_index: 0 }
      names[find_hash[str][:last_index]..-1].each do |name|
        find_hash[str][:size] += 1 if name.length <= str.length && name.start_with?(str)
        find_hash[str][:last_index] += 1
      end
      results << find_hash[str][:size]
    end
  end
  results
end

File.open('contacts_input.txt', 'r') do |f|
  queries_rows = f.gets.strip.to_i

  queries = Array.new(queries_rows)

  queries_rows.times do |i|
    queries[i] = f.gets.rstrip.split
  end

  puts contacts(queries).join("\n")
end
