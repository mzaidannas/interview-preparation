#!/usr/bin/env ruby
# frozen_string_literal: true

class Graph
  Vertex = Struct.new(:name, :neighbours, :dist, :prev)

  def initialize(nodes, graph)
    @vertices = Hash.new { |h, k| h[k] = Vertex.new(k, [], Float::INFINITY) }
    @edges = {}
    graph.each do |(v1, v2, dist)|
      @vertices[v1].neighbours << v2
      @vertices[v2].neighbours << v1
      @edges[[v1, v2]] = @edges[[v2, v1]] = dist
    end
    @dijkstra_source = nil
    @nodes = nodes
  end

  def dikstra(source)
    return if @dijkstra_source == source

    q = @vertices.values
    @vertices[source].dist = 0
    until q.empty?
      u = q.min_by { |vetex| vetex.dist }
      break if u.dist == Float::INFINITY

      q.delete(u)
      u.neighbours.each do |v|
        vv = @vertices[v]
        next unless q.include?(vv)

        alt = u.dist + @edges[[u.name, v]]
        if alt < vv.dist
          vv.dist = alt
          vv.prev = u.name
        end
      end
    end
    @dijkstra_source = source
  end

  def shortest_path(source, target)
    dikstra(source)
    path = []
    u = target
    while u
      path.unshift(u)
      u = @vertices[u].prev
    end
    [path, @vertices[target].dist]
  end

  def shortest_paths(source)
    dikstra(source)
    (@nodes - [source]).map do |target|
      path = []
      u = target
      while u
        path.unshift(u)
        u = @vertices[u].prev
      end
      [path, @vertices[target].dist.infinite? ? -1 : @vertices[target].dist]
    end
  end

  def to_s
    format('#<%s vertices=%p edges=%p>', self.class.name, @vertices.values, @edges)
  end
end

File.open('shortest_path_graph_input.txt', 'r') do |f|
  queries = f.gets.chomp.to_i
  queries.times do
    num_nodes, num_edges = f.gets.chomp.split.map(&:to_i)
    edges = num_edges.times.map do
      f.gets.chomp.split.map(&:to_i) << 6
    end
    starting_node = f.gets.chomp.to_i
    g = Graph.new((1..num_nodes).step.to_a, edges)

    puts g.shortest_paths(starting_node).map { |arr| arr[1] }.join(' ')
  end
end
