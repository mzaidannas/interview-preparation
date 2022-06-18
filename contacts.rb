#!/usr/bin/env ruby

class Node
  attr_reader   :value, :next
  attr_accessor :word

  def initialize(value)
    @value = value

    @word  = false
    @next  = []
  end
end

class Trie
  def initialize
    @root = Node.new('*')
  end

  def add_character(character, trie)
    trie.find { |n| n.value == character } || add_node(character, trie)
  end

  def find_character(character, trie)
    trie.find { |n| n.value == character }
  end

  def add_node(character, trie)
    Node.new(character).tap { |new_node| trie << new_node }
  end

  def add_word(word)
    letters = word.chars
    base    = @root

    letters.each { |letter| base = add_character(letter, base.next) }

    base.word = true
  end

  def find_word(word)
    letters = word.chars
    base    = @root

    word_found =
      letters.all? { |letter| base = find_character(letter, base.next) }

    yield word_found, base if block_given?

    base
  end

  def include?(word)
    find_word(word) { |found, base| return found && base.word }
  end

  def find_words_starting_with(prefix)
    stack        = []
    words        = []
    prefix_stack = []

    stack        << find_word(prefix)
    prefix_stack << prefix.chars.take(prefix.size - 1)

    return [] unless stack.first

    until stack.empty?
      node = stack.pop

      prefix_stack.pop and next if node == :guard_node

      prefix_stack << node.value
      stack        << :guard_node

      words << prefix_stack.join if node.word

      node.next.each { |n| stack << n }
    end

    words
  end

  def find_words_size_starting_with(prefix)
    stack        = []
    word_size        = 0
    prefix_stack = []

    stack        << find_word(prefix)
    prefix_stack << prefix.chars.take(prefix.size - 1)

    return word_size unless stack.first

    until stack.empty?
      node = stack.pop

      prefix_stack.pop and next if node == :guard_node

      prefix_stack << node.value
      stack        << :guard_node

      word_size += 1 if node.word

      node.next.each { |n| stack << n }
    end

    word_size
  end
end

def contacts(queries)
  finds = []
  names = Trie.new
  queries.each do |query|
    operation, str = query
    if operation == 'add'
      names.add_word str
    else
      finds << str
    end
  end
  finds.map do |sub|
    names.find_words_size_starting_with(sub)
  end
end

File.open('contacts_input.txt', 'r') do |f|
  queries_rows = f.gets.strip.to_i

  queries = Array.new(queries_rows)

  queries_rows.times do |i|
    queries[i] = f.gets.rstrip.split
  end

  File.write('contacts_output_2.txt', contacts(queries).join("\n"))
end
