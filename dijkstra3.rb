#!/usr/bin/env ruby
# frozen_string_literal: true

def shortest_path_wg(v, matrix, init = 0)
  vertex = []
  dist = []
  prev = []

  v.times do |i|
    dist << Float::INFINITY
    prev << -1
    vertex << i
  end

  dist[init] = 0

  while vertex.length.positive?
    u = vertex.shift

    matrix[u]&.each_with_index do |i, j|
      next if i.zero?

      alt =  dist[u] + i
      if alt < dist[j]
        dist[j] = alt
        prev[j] = i
      end
    end
  end

  dist.map! { |x| x.infinite? ? -1 : x }
end

File.open('shortest_path_graph_input.txt') do |f|
  queries = f.gets.chomp.to_i
  queries.times do
    num_nodes, num_edges = f.gets.chomp.split.map(&:to_i)
    edges = Array.new(num_edges) do
      (f.gets.chomp.split.map(&:to_i) << 6)
    end
    starting_node = f.gets.chomp.to_i

    p shortest_path_wg(num_nodes, edges, starting_node - 1)
  end
end
