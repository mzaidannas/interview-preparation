#!/usr/bin/env ruby
# frozen_string_literal: true

# Ruby program for binary traversal of binary tree

# A binary tree node
Node = Struct.new :data, :left, :right, :level do
  def to_s
    data
  end
end

# A simple function to print leaf nodes of a Binary Tree
def print_leaves(root)
  return unless root

  print_leaves(root.left)

  # Print it if it is a leaf node
  puts root.data if root.left.nil? && root.right.nil?

  print_leaves(root.right)
end

# A function to print all left boundary nodes, except a
# leaf node. Print the nodes in TOP DOWN manner
def print_boundary_left(root)
  return unless root

  if root.left
    # to ensure top down order, print the node
    # before calling itself for left subtree
    puts root.data
    print_boundary_left(root.left)
  elsif root.right
    puts root.data
    print_boundary_left(root.right)
  end

  # do nothing if it is a leaf node, this way we
  # avoid duplicates in output
end

# A function to print all right boundary nodes, except
# a leaf node. Print the nodes in BOTTOM UP manner
def print_boundary_right(root)
  return unless root

  if root.right
    # to ensure bottom up order, first call for
    # right subtree, then print this node
    print_boundary_right(root.right)
    puts root.data
  elsif root.left
    print_boundary_right(root.left)
    puts root.data
  end

  # do nothing if it is a leaf node, this way we
  # avoid duplicates in output
end

# A function to do boundary traversal of a given binary tree
def print_boundary(root)
  return unless root

  puts root.data

  # Print the left boundary in top-down manner
  print_boundary_left(root.left)

  # Print all leaf nodes
  print_leaves(root.left)
  print_leaves(root.right)

  # Print the right boundary in bottom-up manner
  print_boundary_right(root.right)
end

# Driver program to test above function
root = Node.new(20)
root.left = Node.new(8)
root.left.left = Node.new(4)
root.left.right = Node.new(12)
root.left.right.left = Node.new(10)
root.left.right.right = Node.new(14)
root.right = Node.new(22)
root.right.right = Node.new(25)
print_boundary(root)
