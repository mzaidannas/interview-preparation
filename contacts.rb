#!/usr/bin/env ruby
# frozen_string_literal: true

# We're going to make our own Contacts application! The application must perform two types of operations:

# add name, where  is a string denoting a contact name. This must store  as a new contact in the application.
# find partial, where  is a string denoting a partial name to search the application for. It must count the number of contacts starting with  and print the count on a new line.
# Given  sequential add and find operations, perform each operation in order.

# Example
# Operations are requested as follows:

# add ed
# add eddie
# add edward
# find ed
# add edwina
# find edw
# find a
# Three  operations include the names 'ed', 'eddie', and 'edward'. Next,  matches all  names. Note that it matches and counts the entire name 'ed'. Next, add 'edwina' and then find 'edw'.  names match: 'edward' and 'edwina'. In the final operation, there are  names that start with 'a'. Return the array .

# Function Description

# Complete the contacts function below.

# contacts has the following parameters:

# string queries[n]: the operations to perform
# Returns

# int[]: the results of each find operation
# Input Format

# The first line contains a single integer, , the number of operations to perform (the size of ).
# Each of the following  lines contains a string, .

# Constraints

#  and  contain lowercase English letters only.
# The input does not have any duplicate  for the  operation.
# Sample Input

# STDIN           Function
# -----           --------
# 4               queries[] size n = 4
# add hack        queries = ['add hack', 'add hackerrank', 'find hac', 'find hak']
# add hackerrank
# find hac
# find hak
# Sample Output

# 2
# 0
# Explanation

# Add a contact named hack.
# Add a contact named hackerrank.
# Find the number of contact names beginning with hac. Both name start with hac, add  to the return array.
# Find the number of contact names beginning with hak. neither name starts with hak, add  to the return array.

def contacts(queries)
  finds = []
  prefix_counts = Hash.new(0)
  queries.each do |query|
    operation, str = query
    if operation == 'add'
      0..(str.length.times do |i|
        prefix_counts[str[0..i]] += 1
      end)
    else
      finds << prefix_counts[str]
    end
  end
  finds
end

File.open('contacts_input.txt', 'r') do |f|
  queries_rows = f.gets.strip.to_i

  queries = Array.new(queries_rows)

  queries_rows.times do |i|
    queries[i] = f.gets.rstrip.split
  end

  puts contacts(queries).join("\n")
end
