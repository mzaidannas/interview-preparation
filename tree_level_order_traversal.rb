#!/usr/bin/env ruby

class Node
  attr_accessor :info, :left, :right, :level

  def initialize(info)
    self.info = info
    self.left = nil
    self.right = nil
    self.level = nil
  end

  def to_s
    info
  end
end

class BinarySearchTree
  attr_accessor :root

  def initialize
    self.root = nil
  end

  def create(val)
    if root.nil?
      self.root = Node.new val
    else
      current = root

      loop do
        if val < current.info
          if current.left
            current = current.left
          else
            current.left = Node.new val
            break
          end
        elsif val > current.info
          if current.right
            current = current.right
          else
            current.right = Node.new val
            break
          end
        else
          break
        end
      end
    end
  end
end

def level_order(root)
  return [] if root.nil?

  queue = [root]
  result = []
  while queue.any?
    current = queue.shift
    result << current.info
    queue << current.left if current.left
    queue << current.right if current.right
  end
  result
end

tree = BinarySearchTree.new
size = gets.chomp.to_i

arr = gets.chomp.split.map(&:to_i)

(0..size - 1).each do |i|
  tree.create(arr[i])
end

puts level_order(tree.root).join(' -> ')
