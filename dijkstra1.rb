#!/usr/bin/env ruby
# frozen_string_literal: true

class Graph
  attr_reader :graph, :nodes, :previous, :distance # getter methods

  def initialize(nodes)
    @graph = {} # the graph // {node => { edge1 => weight, edge2 => weight}, node2 => ...
    @nodes = nodes
  end

  # connect each node with target and weight
  def connect_graph(source, target, weight)
    if graph.key?(source)
      graph[source][target] = weight
    else
      graph[source] = { target => weight }
    end
  end

  # connect each node bidirectional
  def add_edge(source, target, weight)
    connect_graph(source, target, weight) # directional graph
    connect_graph(target, source, weight) # non directed graph (inserts the other edge too)
  end

  # based of wikipedia's pseudocode: http://en.wikipedia.org/wiki/Dijkstra's_algorithm

  def dijkstra(source)
    @distance = Hash.new(Float::INFINITY) # Unknown distance from source to vertex
    @previous = Hash.new(-1) # Previous node in optimal path from source

    @distance[source] = 0 # Distance from source to source

    unvisited_nodes = @nodes.compact # All nodes initially in Q (unvisited nodes)

    while unvisited_nodes.size.positive?
      min_node = nil

      unvisited_nodes.each do |current_node|
        min_node = current_node if !min_node || (@distance[current_node] && @distance[current_node] < @distance[min_node])
      end

      break if @distance[min_node].infinite?

      unvisited_nodes -= [min_node]

      graph[min_node]&.each_key do |vertex|
        alt = @distance[min_node] + graph[min_node][vertex]

        if alt < @distance[vertex]
          @distance[vertex] = alt
          @previous[vertex] = min_node # A shorter path to v has been found
        end
      end

    end
  end

  # To find the full shortest route to a node

  def find_path(dest)
    find_path @previous[dest] if @previous[dest] != -1
    @path << dest
  end

  # Gets all shortest paths using dijkstra

  def shortest_paths(source)
    @graph_paths = []
    @source = source
    dijkstra source
    nodes.each do |dest|
      @path = []

      find_path dest

      @graph_paths << [dest, @path.dup, @distance[dest]]
    end
    @graph_paths
  end

  # print result

  def print_result
    @graph_paths.each do |graph|
      dest, path, actual_distance = graph
      puts "Target(#{dest})  #{path.join('-->')} : #{actual_distance}"
    end
  end

  def print_dist(source)
    distances = @graph_paths.reject.with_index { |_v, i| i == source - 1 }.map do |graph|
      _dest, _path, actual_distance = graph
      if actual_distance.infinite?
        -1
      else
        actual_distance
      end
    end
    puts distances.join(' ')
  end
end
File.open('shortest_path_graph_input.txt') do |f|
  queries = f.gets.chomp.to_i
  queries.times do
    num_nodes, num_edges = f.gets.chomp.split.map(&:to_i)
    g = Graph.new((1..num_nodes).step.to_a)
    num_edges.times do
      g.add_edge(*(f.gets.chomp.split.map(&:to_i) << 6))
    end
    starting_node = f.gets.chomp.to_i

    g.shortest_paths(starting_node)
    # puts "shortest_path from #{start} to #{stop} has cost #{dist}:"
    g.print_dist(starting_node)
  end
end
