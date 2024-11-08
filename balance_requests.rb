#!/usr/bin/env ruby
# frozen_string_literal: true

def solution(balances, requests)
  sum_h = {
    'transfer' => 3,
    'deposit' => 2,
    'withdraw' => 2
  }.freeze

  requests.each_with_index do |request, index|
    request = request.split(' ')
    sum = request[sum_h[request[0]]].to_i
    mode = request[0]
    if request[1].to_i.zero? || request[1].to_i > balances.length || (mode != 'deposit' && sum > balances[request[1].to_i - 1]) || (request.length > 3 && request[2].to_i > balances.length)
      return [-(index + 1)]
    elsif mode == 'transfer'
      balances[request[1].to_i - 1] -= sum
      balances[request[2].to_i - 1] += sum
    elsif mode == 'deposit'
      balances[request[1].to_i - 1] += sum
    elsif mode == 'withdraw'
      balances[request[1].to_i - 1] -= sum
    end
  end
  balances
end

puts solution([42], ['transfer 1 2 3']).inspect
