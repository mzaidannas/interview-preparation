#!/usr/bin/env ruby
# frozen_string_literal: true

class Graph
  Edge = Struct.new(:weight, :from, :to)
  attr_accessor :nodes, :edges, :starting_node, :distances, :shortest_path_set

  def initialize(nodes, edges, starting_node)
    self.nodes = nodes
    self.edges = edges.map { |arr| Edge.new(6, *arr) }
    self.starting_node = starting_node
    self.distances = Array.new(nodes.length, Float::INFINITY)
    self.shortest_path_set = Array.new(nodes.length, false)
  end

  def shortest_distance
    distances[starting_node - 1] = 0
    unvisited_nodes = nodes.dup - [starting_node]
    while unvisited_nodes.length.positive?
      # nodes.length.times do |_i|
      edges.each do |edge|
        if distances[edge.from - 1] + edge.weight < distances[edge.to - 1]
          distances[edge.to - 1] = distances[edge.from - 1] + edge.weight
          shortest_path_set[edge.to - 1] = true
          unvisited_nodes -= [edge.from - 1]
        elsif distances[edge.to - 1] + edge.weight < distances[edge.from - 1]
          distances[edge.from - 1] = distances[edge.to - 1] + edge.weight
          shortest_path_set[edge.from - 1] = true
          unvisited_nodes -= [edge.to - 1]
        end
      end
    end
    distances.reject.with_index { |_v, i| i == starting_node - 1 }.map { |x| x.infinite? ? -1 : x }
  end
end
File.open('shortest_path_graph_input.txt') do |f|
  queries = f.gets.chomp.to_i
  queries.times do
    num_nodes, num_edges = f.gets.chomp.split.map(&:to_i)
    nodes = (1..num_nodes).step.to_a
    edges = Array.new(num_edges) do
      f.gets.chomp.split.map(&:to_i)
    end
    starting_node = f.gets.chomp.to_i
    puts Graph.new(nodes, edges, starting_node).shortest_distance.join(' ')
  end
end
