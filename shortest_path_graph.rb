#!/usr/bin/env ruby

class Graph
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
    nodes.length.times do |i|
      edges.each do |edge|
        if distances[edge.from - 1] + edge.weight < distances[edge.to - 1]
          distances[edge.to - 1] = distances[edge.from - 1] + edge.weight
          shortest_path_set[edge.to - 1] = true
        elsif distances[edge.to - 1] + edge.weight < distances[edge.from - 1]
          distances[edge.from - 1] = distances[edge.to - 1] + edge.weight
          shortest_path_set[edge.from - 1] = true
        end
      end
    end
    distances.reject.with_index{|v, i| i == starting_node - 1 }.map{ |x| x.infinite? ? -1 : x }
  end
end

class Edge
  attr_accessor :weight, :from, :to

  def initialize(weight, from, to)
    self.weight = weight
    self.from = from
    self.to = to
  end
end

queries = gets.chomp.to_i
graphs = queries.times.map do
  num_nodes, num_edges = gets.chomp.split.map(&:to_i)
  nodes = num_nodes.times.map { |i| i + 1 }
  edges = num_edges.times.map do
    gets.chomp.split.map(&:to_i)
  end
  starting_node = gets.chomp.to_i
  Graph.new(nodes, edges, starting_node)
end

graphs.each do |graph|
  puts graph.shortest_distance.join(' ')
end
