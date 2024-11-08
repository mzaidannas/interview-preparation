#!/usr/bin/env ruby
# frozen_string_literal: true

class TrieNode
  attr_accessor :word, :next

  def initialize
    @next = Array.new(26) # Number of lowercase english alphabets. i.e all possible starting elements of trie
  end
end

def build_trie(words)
  root = TrieNode.new
  words.each do |w|
    p = root
    w.each_char do |c|
      i = c.ord - 'a'.ord # ASCII value of current character minus ASCII value of character 'a'
      p.next[i] = TrieNode.new if p.next[i].nil?
      p = p.next[i]
    end
    p.word = w
  end
  root
end

def dfs(board, i, j, p, res)
  c = board[i][j]
  return if c == '#' || p.next[c.ord - 'a'.ord].nil?

  p = p.next[c.ord - 'a'.ord]
  unless p.word.nil? # found one
    res << p.word
    p.word = nil     # de-duplicate
  end

  board[i][j] = '#'
  dfs(board, i - 1, j, p, res) if i > 0
  dfs(board, i, j - 1, p, res) if j > 0
  dfs(board, i + 1, j, p, res) if i < board.length - 1
  dfs(board, i, j + 1, p, res) if j < board[0].length - 1
  board[i][j] = c
end

# @param {Character[][]} board
# @param {String[]} words
# @return {String[]}
def find_words(board, words)
  res = []
  root = build_trie(words)
  for i in 0..board.length - 1
    for j in 0..board[0].length - 1
      dfs(board, i, j, root, res)
    end
  end
  res
end

words = find_words(
  [
    %w[a a a a a a a a a a a a],
    %w[a a a a a a a a a a a a],
    %w[a a a a a a a a a a a a],
    %w[a a a a a a a a a a a a],
    %w[a a a a a a a a a a a a],
    %w[a a a a a a a a a a a a],
    %w[a a a a a a a a a a a a],
    %w[a a a a a a a a a a a a],
    %w[a a a a a a a a a a a a],
    %w[a a a a a a a a a a a a],
    %w[a a a a a a a a a a a a],
    %w[a a a a a a a a a a a a]
  ],
  %w[a aa aaa aaaa aaaaa aaaaaa aaaaaaa aaaaaaaa aaaaaaaaa aaaaaaaaaa]
)
puts words.inspect
