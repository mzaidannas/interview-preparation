# frozen_string_literal: true

class Graph
  def initialize
    @vertices = {}
  end

  def add_vertex(name, edges = {})
    @vertices[name] = edges
  end

  def dijkstra(start, finish)
    distances = {}
    previous = {}
    queue = PriorityQueue.new

    @vertices.each_key do |vertex|
      distances[vertex] = Float::INFINITY
      previous[vertex] = nil
      queue.push(vertex, Float::INFINITY) # Initial priority is infinity
    end

    distances[start] = 0
    queue.change_priority(start, 0) # Start node has priority 0

    until queue.empty?
      current_vertex = queue.delete_min

      break if current_vertex == finish # Optimization: Exit early if target is found

      @vertices[current_vertex].each do |neighbor, weight|
        distance = distances[current_vertex] + weight

        next unless distance < distances[neighbor]

        distances[neighbor] = distance
        previous[neighbor] = current_vertex
        queue.change_priority(neighbor, distance)
      end
    end

    path = []
    current = finish
    while current
      path.unshift(current)
      current = previous[current]
    end

    { distance: distances[finish], path: path }
  end
end

# Simple Priority Queue implementation (using a hash and array)
class PriorityQueue
  def initialize
    @elements = []
    @priorities = {}
  end

  def push(element, priority)
    @elements << element
    @priorities[element] = priority
    @elements.sort_by! { |el| @priorities[el] } # Keep sorted
  end

  def delete_min
    return nil if @elements.empty?

    min_element = @elements.shift
    @priorities.delete(min_element)
    min_element
  end

  def change_priority(element, new_priority)
    @priorities[element] = new_priority
    @elements.sort_by! { |el| @priorities[el] } # Resort after change
  end

  def empty?
    @elements.empty?
  end
end

# Example usage:
graph = Graph.new

graph.add_vertex('A', { 'B' => 4, 'C' => 2 })
graph.add_vertex('B', { 'D' => 5, 'E' => 12 })
graph.add_vertex('C', { 'B' => 1, 'D' => 8 })
graph.add_vertex('D', { 'E' => 10 })
graph.add_vertex('E')

result = graph.dijkstra('A', 'E')
puts 'Shortest path from A to E:'
puts "Distance: #{result[:distance]}"
puts "Path: #{result[:path].join(' -> ')}"

result2 = graph.dijkstra('A', 'D')
puts "\nShortest path from A to D:"
puts "Distance: #{result2[:distance]}"
puts "Path: #{result2[:path].join(' -> ')}"

# Example with disconnected graph
graph2 = Graph.new
graph2.add_vertex('A', { 'B' => 4 })
graph2.add_vertex('B')
graph2.add_vertex('C', { 'D' => 1 })
graph2.add_vertex('D')

result3 = graph2.dijkstra('A', 'D')
puts "\nShortest path from A to D (disconnected):"
puts "Distance: #{result3[:distance]}" # Will be infinity
puts "Path: #{result3[:path].join(' -> ')}" # Path will be [A]
