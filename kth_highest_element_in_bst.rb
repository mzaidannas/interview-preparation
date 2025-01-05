#!/usr/bin/env ruby
# frozen_string_literal: true

# Find Kth laegest element in binary search tree

Node = Struct.new :info, :left, :right, :level do
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

def kth_highest(root, k)
  return -1 if root.nil?

  while k.positive?
    start = root
    end_ = root.right
    unless end_.nil?
      k -= 1
      root = root.left
      next
    end

    end_ = end_.left while end_.left.present?

    end_.left = start
    root = root.right
    root.right = nil
  end

  start
end

tree = BinarySearchTree.new
t = gets.chomp.to_i

arr = gets.chomp.split.map(&:to_i)

(0..t - 1).each do |i|
  tree.create(arr[i])
end

puts kth_highest(tree.root, 3)
