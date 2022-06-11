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

def height(root)
  max_level = root.level = 0
  stack = [root]
  while stack.any?
    current = stack.pop
    max_level = [max_level, current.level].max
    if current.left
      stack << current.left
      current.left.level = current.level + 1
    end
    if current.right
      stack << current.right
      current.right.level = current.level + 1
    end
  end
  max_level
end

tree = BinarySearchTree.new
t = gets.chomp.to_i

arr = gets.chomp.split.map(&:to_i)

(1..t).each do |i|
  tree.create(arr[i])
end

puts height(tree.root)
