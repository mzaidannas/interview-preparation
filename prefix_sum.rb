# frozen_string_literal: true

n = 5
queries = [
  1,
  2,
  100,
  2,
  5,
  100,
  3,
  4,
  100
]

# Write your code here
ans = Array.new(n, 0)
queries.each do |i|
  ans[i[0] - 1] += i[2]
  ans[i[1]] -= i[2] if i[1] < ans.length
end
s = 0
max = 0
ans.each do |ele|
  s += ele
  max = [max, s].max
end
puts max
